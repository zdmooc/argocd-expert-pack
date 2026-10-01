# Runbook — Application OutOfSync

1. Capture Application name, revision, Sync and Health.
2. Run/inspect diff before syncing.
3. Identify the exact field/resource causing drift.
4. Determine the owner of that field: Git, operator, admission webhook, human.
5. Correct Git or ownership configuration.
6. Use `ignoreDifferences` only for a narrow, justified field.
7. Sync only after understanding the effect.
8. Capture final Synced/Healthy evidence.

Do not use force sync as the default diagnostic.
