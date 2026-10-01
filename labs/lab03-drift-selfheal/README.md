# Lab03 — Drift et Self-Heal

## Goal

Observe the difference between Git desired state and a live manual change, then verify Argo CD self-heal.

## Preconditions

- Lab02 Application is Synced/Healthy.
- `selfHeal: true`.

## Exercise

```bash
oc -n lab02-guestbook patch deploy guestbook --type merge -p '{"spec":{"replicas":3}}'
oc -n openshift-gitops get application lab02-guestbook -w
oc -n lab02-guestbook get deploy guestbook -w
```

Expected:
1. live replicas temporarily becomes 3;
2. Application detects drift;
3. controller restores replicas to the Git value;
4. Application returns Synced/Healthy.

## Evidence

Capture:
- Git commit/revision;
- before patch;
- OutOfSync transition if visible;
- final replicas;
- final Synced/Healthy.

No new CRC evidence is claimed until this is executed.
