# 07 — Operations / Day-2

## Diagnostic OutOfSync

Ordre recommandé :
1. vérifier revision/path;
2. inspecter diff;
3. identifier le manager du champ;
4. vérifier mutation admission/controller;
5. décider : corriger Git, corriger live controller, ou documenter ignoreDifferences.

Ne pas lancer `sync --force` comme première réponse.

## Application Degraded

Vérifier :
- Deployment/StatefulSet conditions;
- pods/events;
- probes;
- image pull;
- quotas;
- RBAC/SCC;
- storage;
- network;
- dependency readiness.

## Sync stuck

Inspecter :
- operationState;
- hooks;
- finalizers;
- health checks;
- API discovery;
- controller logs.

## Repository error

Vérifier :
- DNS/proxy;
- credentials;
- TLS/CA;
- repo-server logs;
- ref/path.

## Drift

Différencier :
- drift humain;
- controller-generated value;
- admission mutation;
- legitimate runtime field.

## Rollback

Pattern préféré :
1. identifier le dernier commit connu bon;
2. revert Git ou créer un commit correctif;
3. laisser Argo CD réconcilier;
4. valider Health et métier.

Pour les données, un Git revert peut être insuffisant ou dangereux.

## Backup / recovery

La restauration d'Argo CD ne suffit pas à restaurer les workloads ou leurs données. Les repositories Git restent la source de configuration; secrets/credentials et CRs doivent avoir leur stratégie de sauvegarde.

## Upgrade

Avant upgrade :
- compatibilité Operator/CRDs;
- deprecated fields;
- AppProject/ApplicationSet behavior;
- plugins;
- repo auth;
- custom health/diff;
- backup;
- rollback plan de l'instance.

Après upgrade :
- controller/repo-server healthy;
- repos accessibles;
- Applications comparées;
- sync pilot;
- drift/self-heal test en lab.

Voir `runbooks/`.
