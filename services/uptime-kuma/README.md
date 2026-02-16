# Uptime Kuma

## Purpose
Service availability monitoring and alerting.

## Access
Internal:
https://kuma.homelab.internal

Remote:
Accessible via Tailscale subnet routing.

## Port
3001

## Deployment Type
Docker container.

## Monitored Services
- Proxmox
- Grafana
- Vaultwarden
- Nextcloud
- Edge proxy

## Notes
- Alerts configured internally.
- No WAN exposure.
