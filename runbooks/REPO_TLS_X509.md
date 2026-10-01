# Runbook — Repository / TLS / x509

1. Identify repository URL/protocol.
2. Test DNS/proxy reachability from repo-server context.
3. Inspect Argo CD repository status.
4. Inspect repo-server logs.
5. Verify credentials independently from TLS trust.
6. Inspect certificate chain and missing CA.
7. Install the required trust through the supported platform mechanism.
8. Retest and capture Connected/Successful status.

Avoid disabling TLS verification as a production fix.
Never store credentials in evidence.
