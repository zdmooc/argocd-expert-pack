# 01 — Argo CD Core

## Objectifs

Maîtriser le modèle mental Argo CD avant d'automatiser :
- source Git;
- état désiré;
- état live;
- comparaison;
- sync;
- health;
- ownership des ressources.

## Application

Une `Application` relie :
1. une source (`repoURL`, `targetRevision`, `path` ou chart);
2. une destination (cluster + namespace);
3. un `AppProject`;
4. une politique de synchronisation.

Exemple minimal :

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: guestbook
  namespace: openshift-gitops
spec:
  project: labs
  source:
    repoURL: https://github.com/zdmooc/argocd-expert-pack.git
    targetRevision: main
    path: labs/lab02-first-app/manifests/guestbook
  destination:
    server: https://kubernetes.default.svc
    namespace: lab02-guestbook
```

## Sync status vs health

Deux notions doivent rester séparées :

- **Sync** : le live correspond-il au desired Git ?
- **Health** : les ressources sont-elles fonctionnelles ?

Un Deployment peut être Synced mais Degraded. Une Application peut être OutOfSync alors que les pods servent encore du trafic.

## Automated sync

```yaml
syncPolicy:
  automated:
    prune: true
    selfHeal: true
  syncOptions:
    - CreateNamespace=true
```

- `selfHeal` corrige un drift live vers Git;
- `prune` supprime une ressource précédemment gérée lorsqu'elle disparaît du desired state;
- `CreateNamespace=true` simplifie les labs mais ne remplace pas une politique de tenancy.

## Refresh, compare, sync

Cycle logique :

```text
Git revision
  -> manifest generation
  -> desired state
  -> diff against live
  -> OutOfSync/Synced
  -> optional sync
  -> health evaluation
```

## Resource tracking

Argo CD doit savoir quelles ressources appartiennent à une Application. Éviter de gérer le même objet Kubernetes depuis deux Applications différentes.

## Bonnes pratiques

- Git est la source d'intention, pas un miroir généré du cluster.
- Une Application ne doit pas utiliser `default` en production si une frontière AppProject est attendue.
- Éviter `HEAD` pour des releases reproductibles; préférer une branche gouvernée, un tag ou un commit selon le modèle.
- Les secrets réels ne sont jamais stockés en clair dans Git.
- Le rollback applicatif doit être défini au niveau Git/data, pas réduit à un bouton UI.

## Labs

- Lab02 : première Application.
- Lab03 : drift/self-heal.
- Lab04 : prune.
- Lab05 : rollback Git.
