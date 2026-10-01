# Lab02 — First Application via Argo CD

## Goal

Deploy a simple Kustomize workload from this repository and observe the full Argo CD state transition to **Synced / Healthy**.

## Preconditions

Apply the lab AppProject:

```bash
oc apply -f patterns/appproject/labs-project.yaml
```

Then apply the Application:

```bash
oc apply -f labs/lab02-first-app/app/guestbook-app.yaml
```

## Verify

```bash
oc -n openshift-gitops get application lab02-guestbook
oc -n lab02-guestbook get deploy,svc,pods
```

Expected:
- Application = Synced / Healthy;
- Deployment Ready;
- Service present.

## Evidence boundary

Historical evidence in this directory proves only that an earlier Application object was created. The saved status did not prove Synced/Healthy and the workloads evidence file is empty.

The current manifests are therefore **not CRC runtime-proven** until Lab02 is replayed and fresh evidence is captured.
