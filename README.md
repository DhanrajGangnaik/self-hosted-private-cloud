# self-hosted-private-cloud

A “self hosted private cloud” built on with:
- Core platform services (DNS, reverse proxy, dashboard, monitoring)
- App services (Nextcloud, password manager, Portainer, uptime monitoring)
- Remote access via Tailscale (subnet routing + optional MagicDNS)
- Observability with Prometheus + Grafana (and exporters)

## High-level architecture
- **Compute**: Proxmox cluster (pve1, pve2, pve3)
- **Edge**: `edge-proxy` (NGINX reverse proxy + optional TLS termination)
- **DNS**: `dns-server` (authoritative + local zone, e.g., `homelab.internal`)
- **Dashboard**: internal landing page for service links
- **Monitoring**: Prometheus + Grafana on `monitoring` VM
- **Remote access**: Tailscale subnet router on `edge-proxy`

## Repository layout
- `docs/` — human-readable design + runbooks
- `infrastructure/` — networking, Proxmox, Tailscale specifics
- `inventory/` — IP plan + host list + DNS examples (sanitized)
- `monitoring/` — Prometheus/Grafana/exporters config
- `platform/` — platform-layer configs (DNS records, edge proxy, k8s placeholder)
- `services/` — per-service notes/compose placeholders
- `scripts/` — PowerShell helpers (backup, status, sanitize)

## Quick start (documentation-first)
1. Fill `inventory/ip-plan.example.md` with your final IP plan.
2. Fill `inventory/hosts.example.yml` with hosts/services inventory.
3. Configure DNS zone records using `inventory/dns-records.example.md`.
4. Follow `docs/network.md` and `docs/services.md` to deploy services.
5. Bring up monitoring per `docs/monitoring.md`.
6. Enable remote access per `docs/tailscale.md`.

## Security notes
- Never commit real passwords/tokens/keys.
- Keep internal services on LAN only; publish externally only via VPN.
- Prefer least-privilege firewall rules (UDM Pro + host firewalls where needed).

## Status
Work in progress. This repo captures the build and will evolve as more services are added.
