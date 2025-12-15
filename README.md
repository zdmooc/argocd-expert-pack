# ArgoCD Expert Pack (OpenShift GitOps) — CRC-ready

Monorepo d’apprentissage + labs reproductibles sur OpenShift Local (CRC), orienté "production-grade" GitOps avec Argo CD (OpenShift GitOps Operator).

## Structure
- docs/ : cours (concepts, opérations, anti-patterns, capstone)
- labs/ : labs reproductibles + verify.sh + evidence/
- patterns/ : patterns réutilisables (App-of-Apps, ApplicationSet, standard-6files, multi-repo)
- runbooks/ : runbooks ops (OutOfSync, prune, x509, stuck sync, RBAC, upgrade)
- platform/crc/ : bootstrap CRC + instance ArgoCD + scripts setup/cleanup/reset

## Prérequis
- CRC (OpenShift Local) démarré
- oc connecté (kubeadmin)
- OpenShift GitOps installé (namespace: openshift-gitops)

