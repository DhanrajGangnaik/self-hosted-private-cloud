# Nextcloud

## Purpose
Self-hosted cloud storage and collaboration platform.

## Access
Internal:
https://nextcloud.homelab.internal

Remote:
Accessible via Tailscale subnet routing.

## Ports
Internal container port: 80
External access: 443 via NGINX

## Dependencies
- Internal DNS
- NGINX reverse proxy
- Database (if configured)

## Deployment Type
LXC / VM (depending on storage requirement)

## Notes
- Large file uploads require reverse proxy buffer tuning.
- Storage should be mounted on dedicated disk if possible.
