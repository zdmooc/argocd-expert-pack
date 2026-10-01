# 02 — Sync avancé

## Objectifs

Comprendre les comportements de synchronisation qui rendent GitOps sûr ou dangereux :
- automated sync;
- self-heal;
- prune;
- sync options;
- waves;
- hooks;
- diff customisation.

## Self-heal

Le self-heal traite le drift hors Git. Exemple : un opérateur modifie manuellement `replicas: 3` alors que Git déclare `1`.

Attendu :
1. l'Application passe OutOfSync;
2. le controller détecte le drift;
3. avec `selfHeal: true`, Argo CD restaure l'état Git.

Le lab doit capturer le before/after, pas seulement un manifest.

## Prune

Le prune supprime les ressources gérées qui ne sont plus présentes dans le desired state.

Risque principal : une suppression Git peut devenir une suppression cluster.

Gouvernance recommandée :
- review obligatoire;
- protection des namespaces/ressources sensibles;
- `Prune=false` ou `Prune=confirm` lorsque justifié;
- fenêtre de changement pour les ressources stateful.

## Sync options utiles

Exemples :

```yaml
syncOptions:
  - CreateNamespace=true
  - PruneLast=true
  - ApplyOutOfSyncOnly=true
```

Chaque option doit résoudre un besoin concret. Éviter les listes copiées sans compréhension.

## Sync waves

Annotation :

```yaml
metadata:
  annotations:
    argocd.argoproj.io/sync-wave: "10"
```

Ordre typique :
- wave -10 : prérequis;
- wave 0 : config/secrets references;
- wave 10 : workloads;
- wave 20 : exposition;
- wave 30 : validation.

Une wave ordonne l'application des ressources; elle ne garantit pas à elle seule la readiness métier d'une dépendance.

## Hooks

Phases :
- PreSync;
- Sync;
- PostSync;
- SyncFail.

Utiliser les hooks pour des actions de déploiement idempotentes. Ne pas y cacher des migrations irréversibles non gouvernées.

## ignoreDifferences

À utiliser pour des champs modifiés légitimement par un controller.

Mauvais usage : masquer tout un objet pour faire disparaître OutOfSync.

Bon usage : ignorer un champ précis, documenté et contrôlé.

## Retry

Le retry automatique aide sur les erreurs transitoires mais ne doit pas boucler sur une erreur de design.

## Preuves attendues

Un lab sync avancé doit capturer :
- revision;
- Sync status;
- Health;
- ressource live;
- événement de drift;
- réconciliation;
- logs/controller si anomalie.
