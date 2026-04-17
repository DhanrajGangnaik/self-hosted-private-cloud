# 🌐 Networking Architecture

This document defines the **network design, routing, and access model** of the self-hosted private cloud.

---

## 🧠 Network Overview

![Access & DNS Flow](../../docs/diagrams/02_access_and_dns_flow.png)

The platform uses a **segmented internal network** with controlled ingress via a reverse proxy and secure remote access through Tailscale.

---

## 🏗️ Core Components

### Gateway
- **Device**: UDM Pro
- Responsibilities:
  - VLAN segmentation
  - Firewall rules
  - DHCP
  - Internet gateway

---

### Internal DNS
- **Service**: Technitium DNS
- Domain: `homelab.internal`
- Responsibilities:
  - Internal service resolution
  - Local zone management
  - Custom DNS records for services

---

### Reverse Proxy (Ingress Layer)
- **Service**: NGINX (`edge-proxy`)
- Responsibilities:
  - Route traffic to internal services
  - Handle domain-based routing
  - Optional TLS termination
- Example:
  - `grafana.homelab.internal → monitoring VM`
  - `nextcloud.homelab.internal → Nextcloud service`

---

### Remote Access (VPN)
- **Service**: Tailscale
- Mode: Subnet Router
- Features:
  - Secure remote access to internal services
  - No public exposure required
  - Optional MagicDNS support

---

## 🔀 Traffic Flow

### Internal Access
```text
User → DNS (Technitium) → edge-proxy → Service