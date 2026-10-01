# Standard six-file product GitOps contract

A compact product/environment contract can be organized around six responsibilities:

1. `namespace.yaml` — tenancy target;
2. `deployment.yaml` — workload desired state;
3. `service.yaml` — service discovery;
4. `route-or-ingress.yaml` — exposure when required;
5. `networkpolicy.yaml` — traffic contract;
6. `kustomization.yaml` — composition/overlays.

This is a teaching convention, not an Argo CD requirement.

Secrets are deliberately excluded: use the target platform's secret-delivery mechanism rather than committing credentials.
