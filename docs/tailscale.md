# Tailscale remote access

## Goal
Reach the entire homelab subnet (`192.168.50.0/24`) from anywhere without exposing ports publicly.

## Recommended topology
- Install Tailscale on `edge-proxy` (always-on host on LAN).
- Configure as **subnet router** advertising `192.168.50.0/24`.
- Approve routes in Tailscale admin console.
- Remote devices (Windows/iPad) connect via Tailscale and can reach LAN IPs + internal DNS names (optional).

## Subnet router commands (Linux)
Bring daemon up:
- `systemctl enable --now tailscaled`

Advertise subnet route:
- `tailscale up --advertise-routes=192.168.50.0/24 --accept-dns=false`

Important:
- Enable IP forwarding on subnet router
- Ensure your Tailscale admin panel approves advertised routes

See `infrastructure/tailscale/subnet-router.md` for the exact steps.

## Accessing services from remote device
Option A (simple):
- Use LAN IPs via subnet routing:
  - `http://192.168.50.223` (edge proxy)
  - `http://192.168.50.85:9090` (prometheus)

Option B (preferred):
- Use internal DNS names:
  - `http://dashboard.homelab.internal`
This requires remote device to use your DNS (MagicDNS or split-DNS config).

## Common issue: device can see Tailscale peers but cannot reach LAN
Usually one of:
- Subnet route not approved in admin panel
- IP forwarding disabled on subnet router
- ACL blocks access to subnet
- Client not using subnet routes (check client settings)
