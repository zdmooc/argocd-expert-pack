# 03 — Multi-tenancy avec AppProject

## Objectif

Utiliser `AppProject` comme frontière de gouvernance pour limiter :
- dépôts autorisés;
- clusters autorisés;
- namespaces cibles;
- types de ressources;
- rôles Argo CD.

## Source repositories

```yaml
spec:
  sourceRepos:
    - https://github.com/zdmooc/argocd-expert-pack.git
```

Éviter `*` si une liste explicite suffit.

## Destinations

```yaml
destinations:
  - server: https://kubernetes.default.svc
    namespace: team-a-*
```

Le namespace reste une frontière Kubernetes à compléter par RBAC, NetworkPolicy, quotas et politiques de plateforme.

## Cluster-scoped resources

Une Application tenant ne doit généralement pas pouvoir créer librement des ressources cluster-wide.

Exemple restrictif :

```yaml
clusterResourceWhitelist: []
namespaceResourceWhitelist:
  - group: apps
    kind: Deployment
  - group: ""
    kind: Service
```

Dans un lab, une whitelist plus large peut être utilisée mais doit être identifiée comme simplification.

## Roles AppProject

Les rôles Argo CD peuvent limiter les actions UI/API sur les Applications du projet.

Ils ne remplacent pas :
- OpenShift RBAC;
- l'authentification SSO;
- les contrôles Git;
- les policies admission.

## Pattern bancaire/entreprise

Séparation fréquente :
- platform project;
- shared-services project;
- product/team projects;
- sandbox/lab project.

Chaque projet déclare explicitement ses sources et destinations.

## Anti-patterns

- tout mettre dans `default`;
- `sourceRepos: ["*"]`;
- destination `*` sur tous namespaces;
- clusterResourceWhitelist totale pour les équipes applicatives;
- mêmes credentials repo pour tous les tenants sans raison.

## Preuve

Le lab multi-tenancy doit prouver au minimum :
- une Application autorisée acceptée;
- une destination ou source interdite rejetée par la politique.
