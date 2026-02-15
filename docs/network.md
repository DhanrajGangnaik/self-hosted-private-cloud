# Network

## Addressing (example)
- Primary LAN: `192.168.50.0/24`
- Gateway: `192.168.50.1`
- DNS: `192.168.50.20`
- Reverse proxy: `192.168.50.223`
- Monitoring: `192.168.50.85`

Document the definitive plan in:
- `inventory/ip-plan.example.md`
- `inventory/hosts.example.yml`

## DNS pattern
- Internal zone: `homelab.internal`
- A records for services:
  - `dashboard.homelab.internal` -> dashboard VM IP
  - `nextcloud.homelab.internal` -> nextcloud IP
  - `portainer.homelab.internal` -> portainer IP
  - `vaultwarden.homelab.internal` -> password manager IP
- Reverse proxy can front these with NGINX virtual hosts.

## Firewall principles (UDM Pro)
- Default deny between VLANs (if segmented)
- Allow only required flows:
  - clients -> DNS (53)
  - clients -> reverse proxy (80/443)
  - monitoring -> exporters (9100, etc.)
  - admin -> Proxmox UI (8006) from admin VLAN only

See:
- `infrastructure/networking/vlans.md`
- `infrastructure/networking/udm-pro-rules.md`
