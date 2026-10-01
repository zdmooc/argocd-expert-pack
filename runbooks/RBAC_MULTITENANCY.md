# Runbook — RBAC / Multi-tenancy

Check four layers independently:
1. SSO identity/group mapping;
2. Argo CD RBAC;
3. AppProject source/destination/resource boundaries;
4. Kubernetes/OpenShift RBAC/SCC.

For an authorization incident:
- capture user/group identity;
- identify requested Application/resource/action;
- test AppProject policy;
- test Kubernetes authorization;
- correct the narrowest layer possible.

Do not grant cluster-admin to troubleshoot an application-level permission issue.
