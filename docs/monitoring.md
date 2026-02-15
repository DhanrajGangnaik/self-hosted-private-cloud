# Monitoring (Prometheus + Grafana)

## Targets
- Proxmox nodes: node_exporter (port 9100)
- Key VMs/LXCs: node_exporter where feasible
- Optional: service exporters later (nginx exporter, postgres exporter, etc.)

## Minimal approach
1. Run Prometheus on `monitoring` VM.
2. Install node_exporter on Proxmox hosts first (highest value).
3. Add more exporters only where needed.

## Prometheus configuration strategy
Use **file-based service discovery** so you can add/remove targets quickly:
- `prometheus.yml` references `file_sd_configs`
- Targets live in `/opt/prometheus/targets/*.yml` (or a path you choose)

That means to add a new host:
- edit one small targets file
- reload Prometheus (or restart if lifecycle API is disabled)

## Grafana
- Add Prometheus as data source (`http://<prometheus-ip>:9090`)
- Import dashboards:
  - Node Exporter Full
  - Linux/Host metrics
  - Proxmox dashboards (optional, depends on exporter approach)

## Common troubleshooting
- Target DOWN with `connection refused`:
  - exporter not running
  - firewall blocks 9100
  - wrong IP
- Prometheus reload says "Lifecycle API is not enabled":
  - add `--web.enable-lifecycle` to Prometheus service, or restart service after config change
