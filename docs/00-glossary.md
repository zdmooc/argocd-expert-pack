# 00 — Glossary (Argo CD / OpenShift GitOps)

Objectif: vocabulaire commun, définitions courtes, utilisables dans les labs/runbooks.

## Argo CD
- **Application**: objet Argo CD qui décrit une cible (cluster/namespace) + une source Git (path/chart) + une politique de sync.
- **AppProject**: frontière de sécurité/multi-tenancy (sources autorisées, destinations, allow/deny, RBAC).
- **ApplicationSet**: générateur d’Applications (git/list/matrix/merge/scm provider…), pour multi-env / multi-clusters.
- **Sync**: rendre l’état du cluster conforme à l’état Git.
- **Automated Sync**: `spec.syncPolicy.automated` (optionnellement `prune` + `selfHeal`).
- **Prune**: suppression des ressources gérées qui n’existent plus dans Git.
- **SelfHeal**: re-sync automatique si drift détecté.
- **Diff**: comparaison desired (Git) vs live (cluster). Peut être influencée par ignoreDifferences / managedFields.
- **Health**: état “fonctionnel” d’une ressource (Deployment Ready, Route, etc.).
- **Hook**: ressource annotée pour s’exécuter à un moment du sync (PreSync/Sync/PostSync/SyncFail).
- **Sync Waves**: ordre d’application par vagues via annotation (contrôle fin de dépendances).
- **Repo credentials**: secrets Argo CD pour accéder aux repos (SSH/HTTPS, tokens) — à gérer sans fuite.
- **TLS trust / x509**: confiance CA côté repo-server (problèmes fréquents “x509: certificate signed by unknown authority”).
- **Resource tracking**: comment Argo CD “marque” les ressources (labels/annotations) pour savoir ce qu’il gère.

## OpenShift GitOps (Operator)
- **openshift-gitops**: instance Argo CD “par défaut” gérée par l’Operator.
- **ArgoCD CR**: ressource `argocd.argoproj.io` qui déclare l’instance (réplicas, SSO, routes, config).
- **Route**: exposition réseau OpenShift (terminations TLS: edge / reencrypt / passthrough).
- **Dex**: composant d’identité (souvent présent) ; sur OpenShift, login OAuth est courant.

## CRC
- **CRC (OpenShift Local)**: cluster local pour labs reproductibles.
- **kubeadmin**: admin OpenShift sur CRC (à ne jamais committer dans une evidence).

