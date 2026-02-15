# PowerDNS records (notes)

This file is a **notes/reference** to keep your zone consistent.

## Zone: homelab.internal
- NS: dns01.homelab.internal
- SOA: dns01.homelab.internal hostadmin@homelab.internal

## Recommended record strategy
### Strategy 1: “everything behind edge”
All service names point to edge-proxy IP.
Edge-proxy routes via NGINX vhosts.

Pros:
- one entry point
- consistent URLs
Cons:
- proxy becomes critical dependency

### Strategy 2: “direct per service”
Each service name points to its service IP.

Pros:
- simpler routing
Cons:
- many direct endpoints
- no centralized access controls

Pick one strategy and stick to it.
