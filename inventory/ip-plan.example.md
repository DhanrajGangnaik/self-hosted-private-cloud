# IP Plan (example)

Subnet: `192.168.50.0/24`
Gateway: `192.168.50.1`
DNS: `192.168.50.20`

## Infrastructure
- pve1: 192.168.50.254
- pve2: 192.168.50.10
- pve3: 192.168.50.213

## Core services
- dns01: 192.168.50.20
- edge-proxy: 192.168.50.223
- dashboard: 192.168.50.55 (example)
- monitoring: 192.168.50.85

## Apps
- portainer: 192.168.50.127
- nextcloud: 192.168.50.xx
- vaultwarden: 192.168.50.xx

## Notes
- Keep DNS + edge-proxy on static IPs.
- Keep Proxmox mgmt on static IPs.
- Reserve a DHCP range separate from statics.
