# 05 — Repositories, secrets et TLS

## Principe

Argo CD a besoin d'accéder aux sources Git/Helm/OCI. Les credentials sont des secrets opérationnels et ne doivent jamais apparaître dans ce dépôt.

## Public repository

Les labs utilisent ce dépôt public et ne nécessitent donc pas de token Git.

## Private repository

En entreprise, les options incluent selon le contexte :
- SSH deploy key;
- HTTPS token;
- GitHub App / mécanisme équivalent;
- credentials templates.

Choisir le minimum de privilèges nécessaire.

## Secret hygiene

Interdit :
- token dans `Application.spec.source.repoURL`;
- mot de passe dans README/evidence;
- kubeconfig;
- clé privée;
- secret admin initial non redacted.

Les preuves doivent redacter :
- bearer tokens;
- cookies;
- kubeadmin password;
- private keys;
- internal hostnames si nécessaire.

## TLS / x509

Erreur typique :
`x509: certificate signed by unknown authority`.

Diagnostic :
1. identifier le endpoint exact;
2. inspecter la chaîne de certificats;
3. déterminer la CA manquante;
4. ajouter la confiance de manière gouvernée;
5. retester depuis repo-server.

Ne pas répondre par `insecure=true` sauf lab isolé explicitement documenté.

## SSH known_hosts

La vérification d'hôte SSH fait partie de la chaîne de confiance. Ne pas désactiver globalement la vérification pour contourner une erreur.

## Rotation

Un credential repo doit pouvoir être roté sans modifier les Applications.

## Preuve

Une preuve sûre montre :
- repo Connected/Successful;
- identité du repo;
- mécanisme d'authentification;
- aucun secret.
