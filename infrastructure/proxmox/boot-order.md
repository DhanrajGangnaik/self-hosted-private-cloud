# Proxmox VM/CT boot order

## Approach
Assign low boot order numbers to dependencies and add delays.

### Example boot order numbers
- 101 DNS: order 1 (delay 30s)
- 103 Edge proxy: order 2 (delay 30s)
- 108 Dashboard: order 3 (delay 15s)
- 109 Monitoring: order 4 (delay 30s)
- Apps: order 5+ (delay 10–20s)
- Kubernetes: last (order 9+)

## Proxmox GUI
For each VM/CT:
- Options -> Start at boot: **Yes**
- Options -> Start/Shutdown order:
  - Order: number (1..N)
  - Up delay: seconds
  - Down delay: seconds

## Notes
- Use longer delay if your switch/router takes time to come up.
- Ensure DNS starts before anything relying on name resolution.
