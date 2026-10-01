# 06 — OpenShift GitOps

## Objectif

Comprendre la spécificité d'Argo CD lorsqu'il est fourni via OpenShift GitOps.

## Namespace

Les labs utilisent l'instance observée sous :
`openshift-gitops`.

Une installation réelle peut comporter d'autres instances gérées par des CR ArgoCD.

## Operator

L'Operator gère le cycle de vie de l'instance Argo CD.

La présence d'un CR et de pods Running prouve l'installation technique, pas la qualité d'une configuration GitOps.

## Route

OpenShift peut exposer le serveur via Route.

L'accès UI est utile pour l'exploitation mais le modèle GitOps ne doit pas dépendre d'opérations manuelles dans l'UI.

## SCC / sécurité

Les workloads GitOps restent soumis aux contrôles OpenShift :
- SCC;
- RBAC;
- NetworkPolicy;
- admission policies.

Ne pas accorder `cluster-admin` au controller pour résoudre un problème de droits sans analyser la portée.

## Namespaces managed

Selon l'architecture, la gestion multi-namespace doit être explicitement configurée et gouvernée.

## SSO

En entreprise, privilégier une intégration SSO et des groupes, plutôt que des comptes locaux permanents.

## Historical CRC evidence

Ce dépôt contient une preuve historique où :
- l'instance `openshift-gitops` existait;
- les pods principaux étaient Running;
- la Route existait;
- le CR ArgoCD était présent.

Cette preuve date du 15 décembre 2025 et ne vaut pas preuve de l'état courant du CRC.

## Promotion de preuve

Un nouveau run CRC doit archiver :
- `oc version`;
- ClusterVersion;
- pods GitOps;
- ArgoCD CR;
- Application status;
- événements pertinents;
- résultats drift/self-heal/prune/rollback.
