# Kubernetes (Platform)

This folder documents and stores Kubernetes manifests used for platform-level components
when/if they are moved from VM/LXC into the cluster.

## Current state
- Cluster: Talos-based (planned / WIP)
- These manifests are templates/placeholders.

## Conventions
- `manifests/` contains Kubernetes YAML applied with kubectl
- Keep secrets out of git (use sealed-secrets/external-secrets later)
