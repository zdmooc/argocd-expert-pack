# O5 — Argo CD Expert Pack Completion

**Date:** 2026-10-01

## Goal

Turn the repository from an incomplete learning skeleton into a coherent Argo CD / OpenShift GitOps expert pack with:
- complete course material;
- reusable patterns;
- operational runbooks;
- deterministic static validation;
- reproducible labs;
- explicit evidence levels;
- runtime proof where actually observed.

## Existing evidence at O5 start

### Lab01
Historical CRC/OpenShift evidence exists and shows:
- OpenShift Local running;
- `openshift-gitops` namespace;
- Argo CD / ApplicationSet / repo-server / redis / dex pods Running;
- OpenShift Route present;
- ArgoCD CR present.

Historical preflight was captured on **2025-12-15** with OpenShift 4.19.3.

Allowed claim:
`HISTORICAL_CRC_OPENSHIFT_GITOPS_INSTALL_PROVEN`.

### Lab02
The Application object was created, but stored evidence does not prove:
- Synced;
- Healthy;
- Deployment Ready;
- Service reachable.

Allowed claim:
`APPLICATION_CREATED_ONLY`.

## Iterations

### O5-I1 — Truth and governance
- evidence classification;
- repository structure aligned with README;
- claim/evidence matrix.

### O5-I2 — Expert course
Complete docs 01→09:
- core;
- sync;
- multi-tenancy;
- ApplicationSet;
- repos/secrets/TLS;
- OpenShift GitOps;
- operations;
- anti-patterns;
- capstone.

### O5-I3 — Reusable patterns
- AppProject;
- Application;
- App-of-Apps;
- ApplicationSet list/git;
- sync waves/hooks;
- ignoreDifferences;
- multi-source guidance;
- standard-six-files.

### O5-I4 — Operations runbooks
- OutOfSync;
- stuck sync;
- prune;
- repository/TLS;
- RBAC;
- rollback;
- upgrade;
- disaster/recovery boundaries.

### O5-I5 — Labs
- first app;
- drift/self-heal;
- prune;
- rollback-by-Git;
- AppProject isolation;
- ApplicationSet;
- sync waves/hooks;
- capstone.

### O5-I6 — CI/runtime
- YAML/Kustomize validation;
- Argo CD resource policy checks;
- secret hygiene;
- Kind + real Argo CD controller runtime;
- runtime self-heal proof where deterministic.

### O5-I7 — Closure
- README/roadmap;
- evidence records;
- P0 synchronization.

## Evidence vocabulary

- `REFERENCE`
- `IMPLEMENTED`
- `STATIC_VALIDATED`
- `CI_RUNTIME_PROVEN_ARGOCD_KIND`
- `HISTORICAL_CRC_PROVEN`
- `CRC_RUNTIME_PROVEN`
- `PRODUCTION_REFERENCE`

No static manifest is promoted to runtime evidence.

## Completion

O5 completed on 2026-10-01.

Evidence:
- static CI `36869095275` SUCCESS;
- real Argo CD Kind runtime `36869095353` SUCCESS;
- Argo CD v3.5.3;
- Synced/Healthy, drift, self-heal, prune and desired-state rollback observed.

Current CRC remains a separate `NOT_PROVEN` promotion gate.
