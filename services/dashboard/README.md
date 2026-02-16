# Dashboard Service

## Purpose
Central landing page for all internal homelab services.

Provides quick access links to:
- Proxmox
- Grafana
- Prometheus
- Vaultwarden
- Nextcloud
- Uptime Kuma

## Access
Internal:
http://dashboard.homelab.internal

Remote (Tailscale):
https://dashboard.homelab.internal

## Port
80 (proxied through NGINX)

## Deployment Type
LXC Container

## Reverse Proxy
Handled by edge-proxy (NGINX).

## Notes
- No direct public exposure.
- Only accessible via LAN or Tailscale subnet routing.
