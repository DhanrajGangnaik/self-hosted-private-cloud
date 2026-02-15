# Services

## Platform services (core)
1. **DNS** (PowerDNS / Pi-hole / Unbound / etc.)
   - Zone: `homelab.internal`
   - Stable IP required
2. **Edge proxy** (NGINX)
   - Terminates HTTP (and optionally HTTPS)
   - Reverse proxies to internal services
3. **Dashboard**
   - Single landing page listing services
4. **Monitoring**
   - Prometheus + Grafana
5. **Uptime Kuma**
   - Service availability checks and simple alerting

## Apps
- Nextcloud
- Password manager (e.g., Vaultwarden)
- Portainer

## Naming convention
- Hostnames: `dns01`, `edge-proxy`, `monitoring`, etc.
- Services: `<service>.homelab.internal`

## Deployment notes
- Prefer LXC for lightweight services (DNS, NGINX, dashboard) unless you need full VM isolation.
- Prefer VM for monitoring stack and anything needing kernel-level features.

Service placeholders live in `services/`.
