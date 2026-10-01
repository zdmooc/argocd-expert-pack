# Runbook — OpenShift GitOps / Argo CD Upgrade

Before:
- record Operator/Argo CD state;
- review CRDs/deprecations;
- export relevant CRs/configuration;
- verify repository credentials/CA strategy;
- select pilot Applications;
- define rollback/recovery boundary.

After:
- controller/repo-server/server healthy;
- repositories reachable;
- Applications compare successfully;
- pilot Synced/Healthy;
- drift/self-heal lab passes;
- ApplicationSet generation passes;
- no unexpected RBAC/AppProject regression.

Do not call an upgrade successful only because pods are Running.
