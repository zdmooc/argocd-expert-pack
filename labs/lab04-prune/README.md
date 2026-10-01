# Lab04 — Prune

## Goal

Prove that a resource previously managed by Argo CD is removed after it is intentionally removed from desired state.

## Safe lab procedure

1. Add a disposable ConfigMap to a dedicated lab path and sync it.
2. Confirm it exists and is tracked by the Application.
3. Remove the ConfigMap from Git through a reviewed commit.
4. With prune enabled, observe deletion.
5. Confirm the Application returns Synced/Healthy.

## Evidence

- commit adding the resource;
- live resource present;
- commit removing it;
- prune event/result;
- resource absent;
- final Application state.

Do not perform this exercise on stateful or shared resources.
