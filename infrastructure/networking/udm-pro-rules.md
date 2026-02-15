# UDM Pro firewall rules (high-level)

## Rule order concept
UDM rules are processed top-down inside each section.
Keep rules:
1) specific allows
2) specific blocks
3) default blocks last

## Suggested policy sets
### 1) Management access
Allow Admin VLAN -> Proxmox nodes (TCP 8006, 22)

### 2) DNS
Allow all internal VLANs -> DNS server (UDP/TCP 53)

### 3) Reverse proxy access
Allow internal VLANs -> edge proxy (TCP 80/443)

### 4) Monitoring access
Allow monitoring VM -> all node exporters (TCP 9100)

### 5) Inter-VLAN default block
Block VLAN-to-VLAN (except allows above)

## Notes
- If you publish HTTPS internally, allow 443 only; keep 80 for redirects if needed.
- Keep Proxmox UI reachable only from trusted VLAN.
