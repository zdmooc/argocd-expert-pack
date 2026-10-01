# 09 — Capstone Argo CD / OpenShift GitOps

## But

Assembler les concepts du pack dans un scénario reproductible.

## Architecture

```text
Git repository
   |
   v
AppProject
   |
ApplicationSet / Applications
   |
   v
lab namespaces
   |
   +-- stateless workload
   +-- sync-wave resources
   +-- hook
```

## Exigences

### Governance
- AppProject restrictif;
- dépôt explicite;
- destinations limitées;
- aucun secret réel.

### Deployment
- Kustomize;
- ressources avec requests/limits et probes;
- sync automatisé;
- self-heal activé;
- prune gouverné.

### ApplicationSet
- générer au moins deux Applications de lab;
- vérifier noms et destinations.

### Operations
Provoquer et observer :
- drift;
- self-heal;
- ressource supprimée dans le scénario prune;
- rollback par Git;
- erreur contrôlée de destination/projet;
- correction.

### Evidence
Capturer :
- Git commit;
- Application status;
- Synced/Healthy;
- ressources;
- diff/drift;
- self-heal;
- prune;
- rollback;
- ApplicationSet;
- logs pertinents.

## Niveau de preuve

Une CI Kind avec vrai controller Argo CD peut valider le comportement Kubernetes/Argo CD du lab.

Un run CRC/OpenShift séparé est nécessaire pour promouvoir les mêmes scénarios au niveau OpenShift GitOps.

## Sortie attendue

`CAPSTONE_STATIC_VALIDATED` si seuls manifests/tests statiques passent.

`CI_RUNTIME_PROVEN_ARGOCD_KIND` uniquement si le controller Argo CD est réellement exécuté et les comportements observés.
