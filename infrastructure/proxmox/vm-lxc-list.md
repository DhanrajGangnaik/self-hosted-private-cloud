# VM/LXC inventory (example)

> Keep this file updated as your cluster changes.

## pve1
- 101 (dns-server) — DNS / zone `homelab.internal`
- 102 (PasswordManager) — Vaultwarden (or similar)
- 103 (edge-proxy) — NGINX reverse proxy + Tailscale subnet router
- 107 (cloud) — Nextcloud / storage (or separate Nextcloud VM)
- 108 (dashboard) — service landing page
- 109 (monitoring) — Prometheus + Grafana
- 104/105/106 — k8s CP/Workers (planned)

## pve2
- 201 (k8s-cp2) — planned
- 202/203 — planned

## pve3
- 301 (k8s-cp3) — planned
- 302/303 — planned
