# 📊 Monitoring & Observability

This document defines the **monitoring architecture** of the self-hosted private cloud platform, including metrics collection, visualization, and system visibility.

---

## 🧠 Monitoring Overview

![Monitoring Stack](../docs/diagrams/04_monitoring_stack.png)

The platform uses a **Prometheus + Grafana stack** to collect, store, and visualize metrics across infrastructure and services.

---

## 🏗️ Core Components

### Prometheus (Metrics Collection)
- Collects metrics from:
  - Proxmox nodes
  - System-level exporters
  - Application services
- Uses pull-based scraping model
- Stores time-series data

---

### Grafana (Visualization Layer)
- Queries Prometheus as data source
- Provides dashboards for:
  - Node performance
  - Service health
  - Resource utilization
- Supports alerting and custom dashboards

---

### Exporters

Exporters expose metrics in Prometheus format:

#### Node Exporter
- CPU usage
- Memory utilization
- Disk I/O
- Network statistics

#### Proxmox Exporter
- VM/LXC metrics
- Node-level resource usage

#### Service Metrics (where applicable)
- Application-level monitoring
- Custom metrics endpoints

---

## 🔀 Metrics Flow

```text
Nodes / Services → Exporters → Prometheus → Grafana
```