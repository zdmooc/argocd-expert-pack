#!/usr/bin/env bash
set -euo pipefail

APP_NAMESPACE="${APP_NAMESPACE:-openshift-gitops}"
APP_NAME="${APP_NAME:-lab02-guestbook}"
WORKLOAD_NAMESPACE="${WORKLOAD_NAMESPACE:-lab02-guestbook}"

oc -n "$APP_NAMESPACE" get application "$APP_NAME" -o wide
sync="$(oc -n "$APP_NAMESPACE" get application "$APP_NAME" -o jsonpath='{.status.sync.status}')"
health="$(oc -n "$APP_NAMESPACE" get application "$APP_NAME" -o jsonpath='{.status.health.status}')"

test "$sync" = "Synced"
test "$health" = "Healthy"

oc -n "$WORKLOAD_NAMESPACE" rollout status deploy/guestbook --timeout=120s
oc -n "$WORKLOAD_NAMESPACE" get deploy,svc,pods -o wide

echo "LAB02_SYNCED_HEALTHY=PASS"
