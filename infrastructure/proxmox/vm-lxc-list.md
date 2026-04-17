# Proxmox Cluster – VM & LXC Layout

This document defines the **compute layout and workload distribution** across the Proxmox cluster.

---

## Cluster Overview

![Internal Services Layout](../../docs/diagrams/03_internal_services_layout.png)

The platform runs on a **3-node Proxmox VE cluster**:

- `pve1`
- `pve2`
- `pve3`

Workloads are distributed to ensure **resource balance, isolation, and scalability**.

---

## Node Details

| Node | Role | Description |
|------|------|------------|
| pve1 | Core Services | Hosts primary user-facing applications |
| pve2 | Platform Services | Hosts management and infrastructure tools |
| pve3 | Monitoring | Hosts observability and supporting services |

---

## Workload Distribution

### 🔹 pve1 (Core Services)

| Service       | Type | Description |
|--------------|------|------------|
| Dashboard     | LXC / Docker | Internal landing page |
| Nextcloud     | VM / Container | Private cloud storage |
| Web Apps      | Container | Additional applications |

---

### 🔹 pve2 (Platform Services)

| Service         | Type | Description |
|----------------|------|------------|
| DNS Server      | VM | Technitium DNS (`homelab.internal`) |
| Reverse Proxy   | LXC | NGINX / HAProxy ingress layer |
| Portainer       | Container | Container management UI |
| Vaultwarden     | Container | Password manager |

---

### 🔹 pve3 (Monitoring & Observability)

| Service        | Type | Description |
|---------------|------|------------|
| Prometheus     | VM / Container | Metrics collection |
| Grafana        | Container | Visualization dashboards |
| Uptime Kuma    | Container | Service uptime monitoring |

---

## Resource Allocation (Example)

| Node | CPU | RAM | Storage |
|------|-----|-----|--------|
| pve1 | High | High | App-heavy workloads |
| pve2 | Medium | Medium | Infrastructure services |
| pve3 | Medium | Medium | Monitoring stack |

*(Adjust based on actual hardware)*

---

## Networking

- All nodes connected via internal LAN
- Services exposed through:
  - DNS (`*.homelab.internal`)
  - Reverse proxy (`edge-proxy`)
- No direct public exposure

---

## Isolation Strategy

- Services separated by:
  - VM / LXC boundaries
  - Node-level distribution
- Critical services isolated from user-facing apps
- Monitoring separated for reliability

---

## Design Principles

- Balanced workload distribution
- Separation of concerns
- Scalable architecture
- Fault isolation across nodes

---

## Future Enhancements

- Kubernetes deployment across nodes
- GPU workload allocation (AI/ML)
- Distributed storage integration
- Automated provisioning (Terraform / Ansible)

---