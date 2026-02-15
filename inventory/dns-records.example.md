# DNS Records (example) for `homelab.internal`

Assume:
- edge-proxy: 192.168.50.223
- dashboard: 192.168.50.55
- dns01: 192.168.50.20
- portainer: 192.168.50.127
- monitoring: 192.168.50.85

## Zone apex
- `@  NS  dns01.homelab.internal`
- `@  SOA dns01.homelab.internal hostadmin@homelab.internal`

## A records
- `dns01        A   192.168.50.20`
- `edge-proxy   A   192.168.50.223`
- `dashboard    A   192.168.50.55`
- `portainer    A   192.168.50.127`
- `monitoring   A   192.168.50.85`
- `pve1         A   192.168.50.254`
- `pve2         A   192.168.50.10`
- `pve3         A   192.168.50.213`

## Service names (either direct A or proxy via edge)
Option 1 (direct):
- `nextcloud    A   192.168.50.xx`
- `vaultwarden  A   192.168.50.xx`
- `uptime       A   192.168.50.xx`

Option 2 (everything via edge-proxy):
- `nextcloud    A   192.168.50.223`
- `vaultwarden  A   192.168.50.223`
- `portainer    A   192.168.50.223`
- `uptime       A   192.168.50.223`
- `dashboard    A   192.168.50.223`

Pick one model and keep it consistent.
