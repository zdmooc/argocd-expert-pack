# Claim / Evidence Matrix

**Date:** 2026-10-01  
**Status:** O5 IN PROGRESS

| Capability | Current evidence |
|---|---|
| OpenShift GitOps installation on historical CRC | HISTORICAL_CRC_PROVEN |
| Argo CD Route on historical CRC | HISTORICAL_CRC_PROVEN |
| Lab02 Application creation | APPLICATION_CREATED_ONLY |
| Lab02 Synced/Healthy | NOT_PROVEN |
| Drift detection | NOT_PROVEN |
| Self-heal | NOT_PROVEN |
| Prune | NOT_PROVEN |
| Git rollback | NOT_PROVEN |
| AppProject isolation | NOT_PROVEN |
| ApplicationSet generation | NOT_PROVEN |
| Sync waves/hooks | NOT_PROVEN |
| Current CRC execution | NOT_PROVEN |
| Production | NOT_CLAIMED |

## Historical evidence boundary

The CRC evidence under `labs/lab01-install-openshift-gitops/evidence/` and `platform/crc/evidence/` is retained as historical lab evidence.

It must not be represented as a current 2026-10-01 CRC run.

## Lab02 boundary

`labs/lab02-first-app/evidence/01-apply.txt` proves Application creation.

The stored `02-app.txt` contains no observed Sync/Health values and `03-workloads.txt` is empty.

Therefore Lab02 is not runtime-proven.
