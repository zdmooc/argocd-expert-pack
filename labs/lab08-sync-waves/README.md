# Lab08 — Sync Waves

## Goal

Observe ordered application of namespace/config/workload resources.

Use:
`patterns/sync-waves/`.

Wave order:
- Namespace: -20;
- ConfigMap: -10;
- Deployment: 10.

## Evidence

Capture Argo CD resource status/events showing the sync sequence.

A wave controls ordering; it does not prove downstream business readiness.
