# D-098 — SQY GitOps Evidence Reuse

**Status:** EVIDENCE_REUSE_READY / NO NEW DESTRUCTIVE TEST REQUIRED

## Purpose

D-098 reuses the Argo CD/OpenShift GitOps proofs already present in this specialist repository and in D-093.
The mission needs a coherent GitOps story, not repeated destructive experiments.

## Capabilities to present

- Application / AppProject;
- sync and health;
- drift detection;
- self-heal;
- prune on isolated fixture;
- desired-state rollback;
- sync waves/hooks;
- RBAC/multi-tenancy;
- repository/TLS troubleshooting;
- upgrade runbook.

## Evidence boundaries

Use:
- current Kind runtime proof for generic Argo mechanics;
- D-093 CRC evidence for bounded OpenShift GitOps reconciliation.

Do not claim:
- Argo CD HA;
- production GitOps readiness;
- current CRC lab coverage beyond what has actually been replayed.

## SQY-2 evidence capture

When CRC is next active, capture read-only:
- Applications and health/sync state;
- AppProjects;
- Argo/OpenShift GitOps operator objects;
- selected resource tree;
- repository/source revision where non-sensitive.

A new drift injection is optional and should only use a disposable fixture.

## Upgrade readiness

Before OpenShift GitOps/Argo CD upgrade:
- Operator/channel compatibility;
- CRD/deprecation review;
- repository connectivity;
- AppProject/RBAC regression checks;
- pilot Application Synced/Healthy;
- drift/self-heal regression.

## Gate contribution

This specialist evidence contributes to:
`OPENSHIFT_CAAS_RUNTIME_PACK_READY`.
