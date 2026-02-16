# Portainer

## Purpose
Container management UI.

## Access
Internal:
https://portainer.homelab.internal

Remote:
Accessible through Tailscale.

## Ports
9000 (HTTP)
9443 (HTTPS optional)

## Deployment Type
Docker container.

## Notes
- Should be proxied through NGINX.
- Avoid exposing raw port 9000 externally.
