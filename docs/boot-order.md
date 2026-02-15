# Boot order (homelab)

## Why boot order matters
Some services depend on others:
- Switch/router must be up before hosts get network.
- DNS should be up early so names resolve.
- Reverse proxy should be up before dashboards/apps relying on it.

## Recommended physical boot sequence
1. **Switch** (core switching + VLANs)
2. **Gateway/UDM Pro** (routing, DHCP, firewall)
3. **Proxmox nodes** (pve1, pve2, pve3)
4. **Core platform VMs/LXCs**
   - DNS
   - Edge proxy
   - Dashboard
   - Monitoring
5. **App services**
   - Nextcloud
   - Password manager
   - Portainer
   - Uptime Kuma
6. **Optional/experimental**
   - Kubernetes nodes

## Proxmox start policy guidance
- Give each VM/CT:
  - Start at boot: enabled
  - Boot order numbers (lower starts earlier)
  - Startup delay to stagger load and allow network readiness

See: `infrastructure/proxmox/boot-order.md`
