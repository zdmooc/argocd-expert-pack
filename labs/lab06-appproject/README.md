# Lab06 — AppProject isolation

## Goal

Demonstrate source/destination boundaries.

Use:
`patterns/appproject/labs-project.yaml`.

## Positive case

Create an Application:
- source = this repository;
- destination namespace = `lab-*`.

Expected: accepted and reconciled.

## Negative case

Create a lab Application targeting a namespace outside the allowed pattern.

Expected: project policy prevents valid deployment.

## Evidence

Capture:
- AppProject;
- positive Application status;
- negative Application condition/error;
- no resource created in the forbidden namespace.
