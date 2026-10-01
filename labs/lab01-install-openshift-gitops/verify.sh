#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${NAMESPACE:-openshift-gitops}"
ARGOCD_NAME="${ARGOCD_NAME:-openshift-gitops}"

command -v oc >/dev/null 2>&1 || { echo "oc CLI is required"; exit 1; }

echo "== Identity / API"
oc whoami
oc whoami --show-server
oc version

echo "== Namespace"
oc get namespace "$NAMESPACE"

echo "== Argo CD CR"
oc -n "$NAMESPACE" get argocd "$ARGOCD_NAME" -o wide
echo "OPENSHIFT_GITOPS_ARGOCD_CR=PASS"

echo "== Pods"
oc -n "$NAMESPACE" wait --for=condition=Ready pod --all --timeout=180s
oc -n "$NAMESPACE" get pods -o wide
echo "OPENSHIFT_GITOPS_PODS_READY=PASS"

echo "== Route"
oc -n "$NAMESPACE" get route openshift-gitops-server -o wide
host="$(oc -n "$NAMESPACE" get route openshift-gitops-server -o jsonpath='{.spec.host}')"
test -n "$host"
echo "OPENSHIFT_GITOPS_ROUTE=PASS"

echo "LAB01_OPENSHIFT_GITOPS_VERIFY=PASS"
