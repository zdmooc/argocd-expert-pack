# Claim / Evidence Matrix

**Date:** 2026-10-01  
**Status:** O5 COMPLETE

| Capability | Evidence level | Evidence |
|---|---|---|
| Course 00→09 | STATIC_VALIDATED | CI |
| Patterns / runbooks | STATIC_VALIDATED | CI |
| OpenShift GitOps installation on historical CRC | HISTORICAL_CRC_PROVEN | evidence captured 2025-12-15 |
| Argo CD Route on historical CRC | HISTORICAL_CRC_PROVEN | stored Route evidence |
| Historical Lab02 Application creation | APPLICATION_CREATED_ONLY | old evidence |
| Fresh Lab02 on CRC Synced/Healthy | NOT_PROVEN | replay required |
| Generic Argo CD Synced/Healthy | CI_RUNTIME_PROVEN_ARGOCD_KIND | run 36869095353 |
| Drift injection | CI_RUNTIME_PROVEN_ARGOCD_KIND | run 36869095353 |
| Self-heal | CI_RUNTIME_PROVEN_ARGOCD_KIND | run 36869095353 |
| Prune | CI_RUNTIME_PROVEN_ARGOCD_KIND | run 36869095353 |
| Desired-state rollback v2→v1 | CI_RUNTIME_PROVEN_ARGOCD_KIND | run 36869095353 |
| Production Git revert process | REFERENCE | not runtime-proven |
| AppProject positive/negative isolation | STATIC_VALIDATED | runtime lab pending |
| ApplicationSet generation | STATIC_VALIDATED | runtime lab pending |
| Sync waves/hooks | STATIC_VALIDATED | runtime lab pending |
| Current CRC/OpenShift execution | NOT_PROVEN | fresh execution gate exists |
| HA / production | NOT_CLAIMED | — |

## Static evidence

Argo CD Expert Pack CI:
- run `36869095275`;
- commit `ffdd6601c205a95014f3cbae7e5fa490f1074d18`;
- result: **SUCCESS**.

## Runtime evidence

Argo CD Runtime Proof:
- run `36869095353`;
- commit `ffdd6601c205a95014f3cbae7e5fa490f1074d18`;
- Argo CD: **v3.5.3**;
- result: **SUCCESS**.

Observed markers:

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

## Historical CRC boundary

Existing CRC evidence remains valid as historical lab evidence only. It was captured from an earlier OpenShift Local environment, including a preflight dated 2025-12-15.

It is not promoted to a fresh 2026-10-01 CRC claim.

## Current CRC boundary

`CRC_RUNTIME_PROVEN_OPENSHIFT_GITOPS = false`.

A fresh CRC run must use the Lab01→Lab09 execution path and `platform/crc/EVIDENCE_TEMPLATE.md`.
