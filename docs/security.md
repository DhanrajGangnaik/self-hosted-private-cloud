# Security Architecture

This document defines the **security model, controls, and design principles** of the self-hosted private cloud platform.

---

## Security Overview

The platform follows a **Zero Trust-inspired model**, where:

- No service is exposed publicly by default
- All access is authenticated and restricted
- Internal traffic is controlled and segmented

---

## Core Principles

- **VPN-first access** (no direct public exposure)
- **Least privilege networking**
- **Service isolation**
- **Centralized ingress control**
- **No secrets in repository**

---

## Network Security

### Access Control

- Remote access is only allowed via:
  - **Tailscale VPN**
- No direct port forwarding from the internet

---

### Firewall & Segmentation

- Managed via **UDM Pro**
- VLAN-based segmentation:
  - Management network
  - Services network
  - Monitoring network

