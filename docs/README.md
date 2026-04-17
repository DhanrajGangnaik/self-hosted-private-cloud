# Documentation

This directory contains detailed documentation for the **Self-Hosted Private Cloud Platform**, including architecture, infrastructure design, networking, and operational guides.

---

## Architecture

### High-Level Architecture
![High-Level](diagrams/01_high_level_architecture.png)

### Access & DNS Flow
![Access](diagrams/02_access_and_dns_flow.png)

### Internal Services Layout
![Services](diagrams/03_internal_services_layout.png)

### Monitoring Stack
![Monitoring](diagrams/04_monitoring_stack.png)

### Platform Evolution
![Evolution](diagrams/05_platform_evolution.png)

---

## Infrastructure

### Networking
- VLAN design
- Firewall rules (UDM Pro)
- Internal routing

`../infrastructure/networking/`

---

### Proxmox Cluster
- Node layout (pve1, pve2, pve3)
- VM/LXC distribution
- Boot order configuration

`../infrastructure/proxmox/`

---

### Remote Access (Tailscale)
- Subnet routing
- ACL policies
- Secure access model

`../infrastructure/tailscale/`

---

## Monitoring

- Prometheus setup
- Grafana dashboards
- Exporters (Node, Proxmox)

`../monitoring/`

---

## Platform Layer

- DNS records management
- Reverse proxy configuration
- Kubernetes manifests (future)

`../platform/`

---

## Services

- Nextcloud
- Portainer
- Uptime Kuma
- Dashboard

`../services/`

---

## Notes

- All configurations are sanitized (no secrets included)
- This documentation reflects a **real-world private cloud architecture**
- Designed for scalability and future Kubernetes migration
