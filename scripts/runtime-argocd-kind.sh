#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-argocd-expert-ci}"
KIND_NODE_IMAGE="${KIND_NODE_IMAGE:-kindest/node:v1.31.0}"
ARGOCD_VERSION="${ARGOCD_VERSION:-v3.5.3}"

command -v kind >/dev/null
command -v kubectl >/dev/null
command -v curl >/dev/null

cleanup() {
  status=$?
  if [[ "$status" -ne 0 ]]; then
    echo "== Diagnostics"
    kubectl get nodes -o wide || true
    kubectl get pods -A -o wide || true
    kubectl -n argocd get applications,appprojects -o wide || true
    kubectl -n argocd describe application runtime-self-heal || true
    kubectl -n argocd logs statefulset/argocd-application-controller --tail=200 || true
  fi
  kind delete cluster --name "$CLUSTER_NAME" >/dev/null 2>&1 || true
  exit "$status"
}
trap cleanup EXIT

wait_app() {
  local expected_sync="$1"
  local expected_health="$2"
  local max="${3:-120}"
  local i sync health
  for i in $(seq 1 "$max"); do
    sync="$(kubectl -n argocd get application runtime-self-heal -o jsonpath='{.status.sync.status}' 2>/dev/null || true)"
    health="$(kubectl -n argocd get application runtime-self-heal -o jsonpath='{.status.health.status}' 2>/dev/null || true)"
    echo "app sync=$sync health=$health"
    if [[ "$sync" == "$expected_sync" && "$health" == "$expected_health" ]]; then
      return 0
    fi
    sleep 2
  done
  return 1
}

echo "== Create Kind"
kind create cluster --name "$CLUSTER_NAME" --image "$KIND_NODE_IMAGE" --wait 180s
kubectl wait --for=condition=Ready node --all --timeout=120s

echo "== Install Argo CD $ARGOCD_VERSION"
kubectl create namespace argocd
curl -fsSL   "https://raw.githubusercontent.com/argoproj/argo-cd/$ARGOCD_VERSION/manifests/install.yaml"   -o /tmp/argocd-install.yaml
kubectl apply --server-side --force-conflicts -n argocd -f /tmp/argocd-install.yaml

kubectl -n argocd rollout status deployment/argocd-repo-server --timeout=240s
kubectl -n argocd rollout status deployment/argocd-server --timeout=240s
kubectl -n argocd rollout status deployment/argocd-applicationset-controller --timeout=240s
kubectl -n argocd rollout status statefulset/argocd-application-controller --timeout=240s

echo "ARGOCD_INSTALL_KIND=PASS"
kubectl -n argocd get pods -o wide

echo "== Apply project and application"
kubectl apply -f labs/runtime-ci/argocd/project.yaml
kubectl apply -f labs/runtime-ci/argocd/application.yaml

wait_app Synced Healthy 150
kubectl -n runtime-argocd rollout status deployment/runtime-demo --timeout=180s
kubectl -n runtime-argocd get configmap prune-marker
version="$(kubectl -n runtime-argocd get deploy runtime-demo -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="APP_VERSION")].value}')"
test "$version" = "v2"

echo "ARGOCD_SYNC_HEALTH=PASS"

echo "== Force live drift"
kubectl -n runtime-argocd patch deploy runtime-demo --type merge -p '{"spec":{"replicas":3}}'
drifted="$(kubectl -n runtime-argocd get deploy runtime-demo -o jsonpath='{.spec.replicas}')"
test "$drifted" = "3"
echo "ARGOCD_DRIFT_INJECTED=PASS"

healed=0
for i in $(seq 1 90); do
  replicas="$(kubectl -n runtime-argocd get deploy runtime-demo -o jsonpath='{.spec.replicas}')"
  if [[ "$replicas" == "1" ]]; then
    healed=1
    break
  fi
  sleep 2
done
test "$healed" -eq 1
wait_app Synced Healthy 60

echo "ARGOCD_SELF_HEAL=PASS"

echo "== Switch desired state from v2 to v1"
kubectl -n argocd patch application runtime-self-heal --type merge   -p '{"spec":{"source":{"path":"labs/runtime-ci/versions/v1"}}}'

wait_app Synced Healthy 120
kubectl -n runtime-argocd rollout status deployment/runtime-demo --timeout=180s

version="$(kubectl -n runtime-argocd get deploy runtime-demo -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="APP_VERSION")].value}')"
test "$version" = "v1"

pruned=0
for i in $(seq 1 60); do
  if ! kubectl -n runtime-argocd get configmap prune-marker >/dev/null 2>&1; then
    pruned=1
    break
  fi
  sleep 2
done
test "$pruned" -eq 1

echo "ARGOCD_PRUNE=PASS"
echo "ARGOCD_DESIRED_STATE_ROLLBACK=PASS"
echo "CI_RUNTIME_PROVEN_ARGOCD_KIND=PASS"
echo "openshift_crc_claim=NOT_PROVEN"
