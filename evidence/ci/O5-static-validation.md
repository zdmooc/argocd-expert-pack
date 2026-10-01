# O5 Static Validation Evidence

**Date:** 2026-10-01  
**Workflow:** Argo CD Expert Pack CI  
**Run:** `36869095275`  
**Commit:** `ffdd6601c205a95014f3cbae7e5fa490f1074d18`  
**Result:** SUCCESS

## Validated

- active YAML parses;
- Argo CD Application repository URLs are controlled;
- OpenShift lab resources use `openshift-gitops`;
- Kind runtime lab intentionally uses `argocd`;
- no raw Secret in active lab/pattern surface;
- course TODO skeletons removed;
- shell syntax;
- Kustomize rendering:
  - Lab02;
  - sync waves;
  - App-of-Apps children;
  - runtime v1;
  - runtime v2;
- kubeconform for native Kubernetes rendered resources;
- basic secret-hygiene scan.

## Allowed claim

`STATIC_VALIDATED`.

This does not prove current CRC/OpenShift runtime.
