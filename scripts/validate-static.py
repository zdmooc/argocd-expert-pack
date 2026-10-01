#!/usr/bin/env python3
from __future__ import annotations

import pathlib
import sys
import yaml

ROOT = pathlib.Path(__file__).resolve().parents[1]
errors: list[str] = []

active_roots = [
    ROOT / "patterns",
    ROOT / "labs" / "lab02-first-app",
    ROOT / "labs" / "runtime-ci",
]

for root in active_roots:
    for path in root.rglob("*"):
        if not path.is_file() or path.suffix.lower() not in {".yaml", ".yml"}:
            continue
        rel = path.relative_to(ROOT)
        text = path.read_text(encoding="utf-8", errors="replace")
        if "\t" in text:
            errors.append(f"{rel}: TAB character detected")
        try:
            docs = [d for d in yaml.safe_load_all(text) if d is not None]
        except Exception as exc:
            errors.append(f"{rel}: YAML parse error: {exc}")
            continue

        for doc in docs:
            if not isinstance(doc, dict):
                continue
            kind = doc.get("kind")
            metadata = doc.get("metadata") or {}

            if kind == "Secret":
                errors.append(f"{rel}: raw Secret forbidden in active learning/runtime surface")

            if kind in {"Application", "ApplicationSet"}:
                namespace = metadata.get("namespace")
                if "runtime-ci" in str(rel):
                    if namespace != "argocd":
                        errors.append(f"{rel}: runtime-ci Argo CD namespace must be argocd")
                else:
                    if namespace != "openshift-gitops":
                        errors.append(f"{rel}: OpenShift GitOps resource must use openshift-gitops")

            if kind == "Application":
                source = ((doc.get("spec") or {}).get("source") or {})
                repo_url = source.get("repoURL")
                if repo_url != "https://github.com/zdmooc/argocd-expert-pack.git":
                    errors.append(f"{rel}: unexpected repoURL={repo_url!r}")

for path in (ROOT / "docs").glob("*.md"):
    text = path.read_text(encoding="utf-8", errors="replace")
    if "TODO: contenu à produire" in text:
        errors.append(f"{path.relative_to(ROOT)}: unfinished TODO chapter")

required = [
    ROOT / "patterns" / "README.md",
    ROOT / "runbooks" / "OUT_OF_SYNC.md",
    ROOT / "runbooks" / "ROLLBACK.md",
    ROOT / "labs" / "lab03-drift-selfheal" / "README.md",
    ROOT / "labs" / "lab04-prune" / "README.md",
    ROOT / "labs" / "lab05-rollback" / "README.md",
    ROOT / "labs" / "lab06-appproject" / "README.md",
    ROOT / "labs" / "lab07-applicationset" / "README.md",
    ROOT / "labs" / "lab08-sync-waves" / "README.md",
    ROOT / "labs" / "lab09-capstone" / "README.md",
]
for path in required:
    if not path.exists():
        errors.append(f"missing required asset: {path.relative_to(ROOT)}")

if errors:
    print("ARGOCD_STATIC_VALIDATION=FAIL")
    for err in errors:
        print(f"- {err}")
    sys.exit(1)

print("ARGOCD_STATIC_VALIDATION=PASS")
