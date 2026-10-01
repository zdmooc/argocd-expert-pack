#!/usr/bin/env bash
set -euo pipefail

rm -rf build
mkdir -p build

kubectl kustomize labs/lab02-first-app/manifests/guestbook > build/lab02-guestbook.yaml
kubectl kustomize patterns/sync-waves > build/sync-waves.yaml
kubectl kustomize patterns/app-of-apps/children > build/app-of-apps-children.yaml
kubectl kustomize labs/runtime-ci/versions/v1 > build/runtime-v1.yaml
kubectl kustomize labs/runtime-ci/versions/v2 > build/runtime-v2.yaml

for f in build/*.yaml; do
  test -s "$f"
done

echo "ARGOCD_KUSTOMIZE_RENDER=PASS"
