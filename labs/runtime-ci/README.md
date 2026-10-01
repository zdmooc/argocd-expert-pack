# Runtime CI Lab — real Argo CD on Kind

This lab is executed by GitHub Actions on an ephemeral Kind cluster.

It installs a real Argo CD controller and proves:
- Application reaches Synced/Healthy;
- live replica drift is self-healed;
- switching desired path from v2 to v1 removes a v2-only ConfigMap through prune;
- workload returns to the v1 desired state.

This is **Argo CD on Kind**, not OpenShift GitOps/CRC.

Allowed claim after successful CI:
`CI_RUNTIME_PROVEN_ARGOCD_KIND`.
