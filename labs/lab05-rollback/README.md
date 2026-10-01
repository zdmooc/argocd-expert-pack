# Lab05 — Rollback by desired state

## Goal

Restore a known-good desired state and allow Argo CD to reconcile it.

## Recommended production model

Use a reviewed Git revert/fix commit.

## Lab sequence

1. Start from v1 and record Synced/Healthy.
2. Promote a deliberate v2 change.
3. Validate v2.
4. Revert the desired state to v1.
5. Observe Argo CD reconcile.
6. Validate workload and Application.

Persistent data needs a separate rollback/reconciliation plan.

The CI runtime lab uses two versioned paths to prove controller reconciliation mechanics; it is not presented as proof of a production Git change process.
