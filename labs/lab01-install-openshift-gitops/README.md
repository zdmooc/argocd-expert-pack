# Lab01 — Verify OpenShift GitOps

## Goal

Verify an existing OpenShift GitOps installation without installing a second Argo CD instance.

## Preconditions

- OpenShift/CRC is running;
- `oc` is authenticated;
- OpenShift GitOps Operator has already created an ArgoCD instance named `openshift-gitops`.

## Execute

```bash
bash labs/lab01-install-openshift-gitops/verify.sh
```

Expected markers:

```text
OPENSHIFT_GITOPS_PODS_READY=PASS
OPENSHIFT_GITOPS_ARGOCD_CR=PASS
OPENSHIFT_GITOPS_ROUTE=PASS
LAB01_OPENSHIFT_GITOPS_VERIFY=PASS
```

## Historical evidence

The evidence currently stored under `evidence/` and `platform/crc/evidence/` is historical.

It shows a successful CRC/OpenShift GitOps installation with an OpenShift 4.19.3 preflight captured on **2025-12-15**.

That evidence is retained as:
`HISTORICAL_CRC_OPENSHIFT_GITOPS_INSTALL_PROVEN`.

It is not a claim about today's CRC state.

## Fresh evidence

For a new run, store sanitized output in a new timestamped directory. Never commit:
- kubeadmin password;
- bearer token;
- kubeconfig;
- cookies;
- private keys.
