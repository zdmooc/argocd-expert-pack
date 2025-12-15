#!/usr/bin/env bash
set -euo pipefail
oc -n openshift-gitops get pods -o wide
oc -n openshift-gitops get route
