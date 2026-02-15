# Self-Hosted Private Cloud

Enterprise-style homelab running on Proxmox cluster.

## Core Stack
- Proxmox VE Cluster (PVE1, PVE2, PVE3)
- Kubernetes (Talos planned)
- NGINX Edge Proxy
- Internal DNS
- Prometheus + Grafana Monitoring
- Tailscale Secure Remote Access

## Networking
VLAN segmented homelab behind UDM Pro + Cisco Catalyst 9200L.

## Monitoring
Node exporter on Proxmox hosts.
Central Prometheus + Grafana dashboards.

## Remote Access
Tailscale subnet router via edge-proxy.

## Repo Layout
docs/ – architecture + design  
infrastructure/ – networking, proxmox configs  
platform/ – core services  
monitoring/ – observability stack  
services/ – application services  
scripts/ – automation
