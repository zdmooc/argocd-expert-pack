# Runbook — Drift / Self-Heal

## Trigger

A managed resource differs from Git.

## Diagnose

1. Capture Application Sync/Health and revision.
2. Capture the live object before reconciliation if possible.
3. Identify the changed field and actor.
4. Determine whether the drift is:
   - manual;
   - admission mutation;
   - another controller;
   - an expected runtime field;
   - a real configuration error.

## Self-heal validation

For a disposable lab workload:
1. ensure `selfHeal: true`;
2. inject a controlled live-only change;
3. observe the drift;
4. verify the controller restores Git state;
5. verify Synced/Healthy;
6. capture controller event/log if needed.

## Persistent drift

If the field keeps changing, do not increase sync frequency or force repeatedly. Resolve field ownership or use a narrow, justified `ignoreDifferences`.

## Evidence

Record:
- revision;
- exact live mutation;
- initial value;
- drifted value;
- final healed value;
- final Sync/Health.
