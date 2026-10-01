# Runbook — Prune

## Before enabling prune

- identify which resources Argo CD owns;
- verify the Git deletion is intentional;
- understand finalizers and dependent resources;
- protect stateful/cluster-scoped objects as required;
- review the blast radius.

## Execution

1. Capture resource list before change.
2. Merge the reviewed Git deletion.
3. Observe Application OutOfSync.
4. Observe prune operation.
5. Confirm only intended resources disappear.
6. Verify Application Synced/Healthy.
7. Capture evidence.

For sensitive resources consider explicit confirmation rather than unconditional automated pruning.
