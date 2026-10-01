# Runbook — GitOps Rollback

Preferred model:
1. identify last known-good Git state;
2. create a reviewed revert/fix commit;
3. allow Argo CD to compare and sync;
4. verify workload health and functional smoke;
5. record new revision and evidence.

A workload with persistent data needs a separate data rollback/reconciliation plan.

The O5 CI lab may demonstrate desired-state rollback by switching between two versioned paths. That proves Argo CD reconciliation mechanics, not a production Git revert process.
