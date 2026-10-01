# 04 — ApplicationSet

## Objectif

Générer des Applications de manière déclarative lorsque la topologie devient répétitive.

## Cas d'usage

- un produit sur plusieurs environnements;
- plusieurs clusters;
- un catalogue de tenants;
- découverte de dossiers Git;
- combinaison cluster × environnement.

## List generator

Approprié quand la liste est petite et explicite.

```yaml
generators:
  - list:
      elements:
        - env: dev
          namespace: demo-dev
        - env: preprod
          namespace: demo-preprod
```

## Git directory generator

Approprié lorsque chaque dossier respecte un contrat homogène.

```yaml
generators:
  - git:
      repoURL: https://github.com/zdmooc/argocd-expert-pack.git
      revision: main
      directories:
        - path: patterns/applicationset/environments/*
```

## Matrix / merge

Puissants mais à utiliser avec prudence. Plus un générateur est dynamique, plus la revue du résultat généré est importante.

## Template

Le template produit des `Application`. Les mêmes exigences s'appliquent :
- AppProject;
- repo;
- targetRevision;
- path;
- destination;
- sync policy.

## Gouvernance

Éviter qu'un ApplicationSet puisse générer des destinations arbitraires.

Pour les clusters externes :
- labels de cluster contrôlés;
- credentials gérés par la plateforme;
- AppProject restrictif.

## Suppression

La suppression d'un élément du generator peut supprimer l'Application générée et, selon les finalizers/policies, impacter ses ressources.

Toujours comprendre le cycle de vie avant d'activer une génération massive.

## Preuve

Le lab doit montrer :
- ApplicationSet créé;
- nombre d'Applications générées attendu;
- noms/destinations conformes;
- suppression ou modification testée seulement dans un espace de lab.
