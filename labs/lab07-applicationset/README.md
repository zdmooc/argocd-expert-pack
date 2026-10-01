# Lab07 — ApplicationSet

## Goal

Generate multiple Applications from one declarative template.

Use:
`patterns/applicationset/list.yaml`.

## Exercise

```bash
oc apply -f patterns/appproject/labs-project.yaml
oc apply -f patterns/applicationset/list.yaml
oc -n openshift-gitops get applicationsets
oc -n openshift-gitops get applications
```

Expected:
- two generated Applications;
- deterministic names;
- expected destinations.

## Evidence

Capture the ApplicationSet and generated Applications. Runtime status remains pending until executed on CRC/OpenShift.
