# O5 Argo CD Kind Runtime Evidence

**Date:** 2026-10-01  
**Workflow:** Argo CD Runtime Proof  
**Run:** `36869095353`  
**Commit:** `ffdd6601c205a95014f3cbae7e5fa490f1074d18`  
**Argo CD:** `v3.5.3`  
**Result:** SUCCESS

## Executed runtime

```text
Kind Kubernetes
  -> Argo CD v3.5.3 installed from pinned upstream manifest
  -> AppProject runtime-labs
  -> Application runtime-self-heal
  -> Git source: zdmooc/argocd-expert-pack
  -> desired path v2
  -> Synced / Healthy
  -> live replica drift 1 -> 3
  -> self-heal back to 1
  -> desired path switch v2 -> v1
  -> v2-only ConfigMap pruned
  -> workload version v1
  -> Synced / Healthy
```

## Observed markers

```text
ARGOCD_INSTALL_KIND=PASS
ARGOCD_SYNC_HEALTH=PASS
ARGOCD_DRIFT_INJECTED=PASS
ARGOCD_SELF_HEAL=PASS
rollback sync=Synced health=Healthy version=v1 marker=absent
ARGOCD_PRUNE=PASS
ARGOCD_DESIRED_STATE_ROLLBACK=PASS
CI_RUNTIME_PROVEN_ARGOCD_KIND=PASS
openshift_crc_claim=NOT_PROVEN
```

## Allowed claim

`CI_RUNTIME_PROVEN_ARGOCD_KIND`.

This proves real Argo CD controller behavior for:
- sync/health;
- drift;
- self-heal;
- prune;
- desired-state rollback mechanics.

## Not proven

- OpenShift GitOps current CRC runtime;
- production Git revert governance;
- AppProject negative isolation behavior;
- ApplicationSet runtime generation;
- sync-wave runtime ordering;
- HA Argo CD;
- production readiness.
