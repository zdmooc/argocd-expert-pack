# Runbook — Stuck Sync

Inspect:
- `status.operationState`;
- resource sync status;
- hooks/jobs;
- finalizers;
- API discovery errors;
- controller logs;
- quotas/RBAC/SCC;
- health customizations.

If a hook is stuck, preserve logs/events before deleting anything.

A manual resource deletion is remediation evidence, not root-cause resolution.
