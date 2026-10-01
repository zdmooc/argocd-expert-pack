# Argo CD Expert Pack — OpenShift GitOps

Référentiel d'apprentissage, de patterns, de runbooks et de labs pour Argo CD et OpenShift GitOps.

## Status

**O5 — STATIC_VALIDATED / RUNTIME KIND PROOF IN PROGRESS / CURRENT CRC NOT_PROVEN**

## Scope

This repository owns:
- Argo CD core concepts;
- Application / AppProject / ApplicationSet;
- sync, health, drift and self-heal;
- prune governance;
- sync waves and hooks;
- repository/TLS troubleshooting;
- multi-tenancy/RBAC patterns;
- GitOps rollback mechanics;
- OpenShift GitOps labs and evidence.

It does not own cluster provisioning, common platform services or business workloads.

## Structure

```text
docs/           expert learning path 00→09
labs/           progressive exercises + historical evidence
patterns/       reusable Argo CD patterns
runbooks/       operations / troubleshooting
platform/crc/   historical CRC evidence + fresh CRC gate
evidence/       claim/evidence matrix
scripts/        validation and Kind runtime proof
.github/        static CI + real Argo CD runtime CI
```

## Evidence already established

### Historical CRC / OpenShift GitOps

Stored evidence shows a previous CRC/OpenShift GitOps installation:
- OpenShift Local running;
- `openshift-gitops` namespace;
- Argo CD pods Running;
- ArgoCD CR present;
- OpenShift Route present.

Historical preflight date: **2025-12-15**.

Claim:
`HISTORICAL_CRC_OPENSHIFT_GITOPS_INSTALL_PROVEN`.

This is not a claim about current CRC state.

### Static CI

The repository has automated validation for:
- YAML;
- Kustomize rendering;
- shell syntax;
- Argo CD source/namespace conventions;
- secret hygiene;
- Kubernetes schemas for native resources.

## Runtime CI

`scripts/runtime-argocd-kind.sh` installs a real pinned **Argo CD v3.5.3** on an ephemeral Kind cluster.

The runtime gate attempts to prove:
- Synced/Healthy;
- drift injection;
- self-heal;
- prune;
- desired-state rollback from v2 to v1.

The claim is promoted only after a successful observed workflow run.

## OpenShift / CRC

For a fresh CRC proof, use:
- `labs/lab01-install-openshift-gitops/verify.sh`;
- Lab02→Lab09;
- `platform/crc/EVIDENCE_TEMPLATE.md`.

Current fresh CRC claim:
`NOT_PROVEN`.

## Learning path

Start with `docs/README.md`, then execute the labs in numerical order.

## Safety

Never commit:
- kubeconfig;
- passwords/tokens;
- repository credentials;
- private keys;
- unredacted internal infrastructure evidence.
