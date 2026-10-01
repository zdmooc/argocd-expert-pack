# O5 Completion Record — Argo CD Expert Pack

**Date:** 2026-10-01  
**Status:** O5 COMPLETE

## Starting point

The repository initially had:
- only two labs;
- Lab01 historical CRC evidence;
- Lab02 Application creation without Synced/Healthy proof;
- eight course chapters still TODO;
- README references to patterns/runbooks that did not exist;
- no CI;
- no observed drift/self-heal/prune/rollback proof.

## O5-I1 — Truth / governance

- historical CRC evidence separated from current claims;
- Lab02 overclaim removed;
- repository ownership defined;
- evidence vocabulary introduced.

## O5-I2 — Expert course

Completed docs 01→09:
- core;
- advanced sync;
- multi-tenancy;
- ApplicationSet;
- repos/secrets/TLS;
- OpenShift GitOps;
- operations;
- anti-patterns;
- capstone.

## O5-I3 — Patterns

Added:
- AppProject;
- Application;
- App-of-Apps;
- ApplicationSet;
- sync waves;
- ignoreDifferences;
- six-file product convention.

## O5-I4 — Runbooks

Added:
- OutOfSync;
- drift/self-heal;
- stuck sync;
- prune;
- repo/TLS/x509;
- RBAC/multi-tenancy;
- rollback;
- upgrade.

## O5-I5 — Labs

- Lab02 hardened and verifier added;
- Labs 03→09 created;
- dedicated runtime CI fixture with v1/v2 desired states.

## O5-I6 — CI/runtime

Static:
- YAML and policy validation;
- Kustomize rendering;
- kubeconform;
- shell syntax;
- secret hygiene.

Runtime:
- Kind cluster;
- real pinned Argo CD v3.5.3;
- Synced/Healthy;
- drift injection;
- self-heal;
- prune;
- v2→v1 desired-state rollback.

Evidence:
- static run `36869095275` — SUCCESS;
- runtime run `36869095353` — SUCCESS.

## O5-I7 — Closure

Repository is now a coherent Argo CD/OpenShift GitOps specialist pack.

Final evidence levels:
- docs/patterns/runbooks: `STATIC_VALIDATED`;
- Argo CD Kind behaviors: `CI_RUNTIME_PROVEN_ARGOCD_KIND`;
- old CRC install: `HISTORICAL_CRC_PROVEN`;
- current CRC: `NOT_PROVEN`;
- production: `NOT_CLAIMED`.

## Next environment promotion

A fresh CRC run can promote only the behaviors actually replayed on OpenShift GitOps.

Use `platform/crc/EVIDENCE_TEMPLATE.md`.
