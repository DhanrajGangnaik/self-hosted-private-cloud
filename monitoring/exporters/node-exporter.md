# Node Exporter

## Where to install
- Always: Proxmox hosts (pve1/pve2/pve3)
- Optional: important VMs that need host-level visibility

## Debian/Proxmox install (recommended)
```bash
apt update
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter
ss -tulpn | grep 9100
curl -s http://127.0.0.1:9100/metrics | head
