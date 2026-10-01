# Ownership

This repository owns **Argo CD / OpenShift GitOps learning, patterns, operations and lab evidence**.

It does not own:
- OpenShift cluster provisioning — `k8s-openshift-cluster-factory`;
- common platform services — `shared-platform-services-openshift`;
- workload migration governance — `openshift-migration-framework`;
- deep IAM implementation — `keycloak-enterprise-roadmap-v7`.

## Canonical responsibilities here

- Application / AppProject / ApplicationSet patterns;
- sync behavior;
- drift and self-heal;
- prune governance;
- sync waves/hooks;
- Git-based rollback;
- repository/TLS troubleshooting;
- Argo CD RBAC/multi-tenancy;
- OpenShift GitOps operational runbooks;
- reproducible labs and evidence.

## Rule

This repository may deploy small lab workloads in order to prove GitOps mechanics.

It must not grow into another shared-platform or business-product repository.
