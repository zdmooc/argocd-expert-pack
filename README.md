# Argo CD Expert Pack — OpenShift GitOps

Référentiel d’apprentissage, de patterns, de runbooks et de labs pour Argo CD et OpenShift GitOps.

## Status

**O5 COMPLETE — STATIC_VALIDATED + CI_RUNTIME_PROVEN_ARGOCD_KIND + HISTORICAL_CRC_PROVEN / CURRENT CRC PENDING**

## Canonical scope

This repository owns Argo CD/OpenShift GitOps expertise:
- Application / AppProject / ApplicationSet;
- sync and health;
- drift / self-heal;
- prune;
- sync waves/hooks;
- diff customization;
- repository/TLS troubleshooting;
- multi-tenancy/RBAC;
- GitOps rollback mechanics;
- OpenShift GitOps labs/evidence.

It does not own cluster provisioning, shared platform services or business workloads.

## Structure

```text
docs/           expert learning path 00→09
labs/           progressive labs + runtime CI fixture
patterns/       reusable Argo CD patterns
runbooks/       day-2 operations
platform/crc/   historical evidence + fresh CRC gate
evidence/       claim/evidence records
scripts/        static validation + Kind runtime
.github/        static CI + real Argo CD runtime CI
```

## D-098 — SQY mission reuse

D-098 reuses this repository for deep GitOps evidence rather than repeating destructive tests.

Mission mapping:
- `docs/10-d098-sqy-gitops-evidence-reuse.md`.

Generic Argo mechanics are already runtime-proven on Kind; bounded OpenShift reconciliation evidence is referenced from D-093/K1.

## Proven baseline

### Static

Run `36869095275` — **SUCCESS**  
Commit `ffdd6601c205a95014f3cbae7e5fa490f1074d18`.

### Real Argo CD runtime on Kind

Run `36869095353` — **SUCCESS**  
Argo CD `v3.5.3`.

Observed:

```text
ARGOCD_INSTALL_KIND=PASS
ARGOCD_SYNC_HEALTH=PASS
ARGOCD_DRIFT_INJECTED=PASS
ARGOCD_SELF_HEAL=PASS
ARGOCD_PRUNE=PASS
ARGOCD_DESIRED_STATE_ROLLBACK=PASS
CI_RUNTIME_PROVEN_ARGOCD_KIND=PASS
```

The rollback step finished with:

```text
sync=Synced health=Healthy version=v1 marker=absent
```

## CRC/OpenShift evidence

Historical evidence proves an earlier OpenShift GitOps installation on CRC, with a stored preflight dated **2025-12-15**.

Allowed historical claim:
`HISTORICAL_CRC_OPENSHIFT_GITOPS_INSTALL_PROVEN`.

Current CRC/OpenShift claim:
`NOT_PROVEN`.

A fresh promotion path exists under `platform/crc/` and Lab01→Lab09.

## Evidence boundaries

Not runtime-proven on current CRC:
- fresh Lab02 Synced/Healthy;
- AppProject negative isolation;
- ApplicationSet generation;
- sync-wave ordering.

Not claimed:
- HA Argo CD;
- production GitOps readiness;
- production client topology.

## Start

Read `docs/README.md`, then execute Labs 01→09.

## Safety

Never commit credentials, kubeconfigs, private keys, unredacted tokens or private infrastructure evidence.
