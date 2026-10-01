# CRC / OpenShift GitOps validation

This directory contains historical CRC evidence plus the execution contract for fresh OpenShift GitOps proof.

## Historical evidence

Existing files under `platform/crc/evidence/` were captured from an earlier CRC environment and must remain historical.

## Fresh validation sequence

1. Run Lab01 verification.
2. Apply `patterns/appproject/labs-project.yaml`.
3. Apply Lab02 Application.
4. Run Lab02 verifier.
5. Execute Lab03 drift/self-heal.
6. Execute Lab04 prune on disposable resources.
7. Execute Lab05 rollback.
8. Execute Lab06 AppProject positive/negative cases.
9. Execute Lab07 ApplicationSet.
10. Execute Lab08 sync waves.
11. Capture exact Git revision and sanitized output.

Promotion target:
`CRC_RUNTIME_PROVEN_OPENSHIFT_GITOPS`.

Do not promote from historical files alone.
