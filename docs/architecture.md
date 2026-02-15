# Architecture

## Goals
- Run “private cloud” services at home with enterprise-style patterns:
  - segmented network
  - centralized DNS + reverse proxy
  - monitoring + dashboards
  - secure remote access (VPN / ZTNA)
  - reproducible documentation

## Core components
### Proxmox cluster
- 3 nodes: `pve1`, `pve2`, `pve3`
- VMs/LXCs host services separated by function:
  - edge proxy
  - DNS
  - dashboard
  - monitoring
  - apps (Nextcloud, password manager, Portainer, Uptime Kuma)

### Networking
- Primary LAN: `192.168.50.0/24` (example)
- DNS service provides `homelab.internal` zone.
- Reverse proxy consolidates access via `*.homelab.internal`.

### Access layer
- Internal access:
  - `dashboard.homelab.internal` -> dashboard VM
  - `nextcloud.homelab.internal` -> nextcloud
  - `portainer.homelab.internal` -> portainer
  - `vaultwarden.homelab.internal` -> password manager
- Remote access:
  - Tailscale subnet router advertises `192.168.50.0/24`
  - Remote clients reach internal services without exposing ports publicly.

## Observability
- Prometheus scrapes:
  - node exporter on Proxmox hosts and selected VMs/LXCs
- Grafana dashboards:
  - host health (CPU/RAM/disk/network)
  - service status (via Uptime Kuma or exporter-based checks)

## Design principles
- Keep it simple: one reverse proxy, one DNS authority, one monitoring stack.
- Document decisions and runbooks as you build.
- No inbound public exposure unless absolutely required.
