# 08 — Anti-patterns GitOps

## 1. Tout dans default

Sans AppProject, la frontière de tenancy est faible.

## 2. Wildcards partout

`sourceRepos: ["*"]`, toutes destinations et toutes ressources cluster-scoped augmentent le blast radius.

## 3. Credentials dans Git

Même en base64, un Secret Kubernetes reste un secret exposé si la valeur réelle est commitée.

## 4. Deux outils possèdent la même ressource

Helm CI, `kubectl apply` manuel et Argo CD ne doivent pas se battre pour le même objet.

## 5. selfHeal sans comprendre le drift

Peut provoquer une boucle si un autre controller modifie le même champ.

## 6. prune activé sans gouvernance

Une suppression Git devient potentiellement une suppression cluster.

## 7. ignoreDifferences trop large

Masquer les divergences ne résout pas leur cause.

## 8. `HEAD` non gouverné partout

Réduit la reproductibilité des promotions.

## 9. auto-sync production sans contrôle Git

Le contrôle doit être déplacé dans les protections de branches/MR et le modèle de promotion, pas supprimé.

## 10. rollback = cli rollback

Pour les workloads stateful, le problème principal est souvent la donnée, pas seulement les manifests.

## 11. App-of-Apps gigantesque

Un root qui mélange plateforme, produits et environnements peut créer un blast radius excessif. Préférer des frontières cohérentes.

## 12. ApplicationSet dynamique non borné

Un générateur mal filtré peut créer/supprimer beaucoup d'Applications.

## 13. UI comme source de vérité

Les changements durables doivent revenir dans Git.

## 14. preuves non datées

Une capture `Synced Healthy` sans commit/revision/date est faible.

## 15. confusion installation vs usage

Des pods Argo CD Running ne prouvent ni self-heal, ni prune, ni rollback.
