# Tailscale subnet router (edge-proxy)

## 1) Install + start daemon

```sudo systemctl enable --now tailscaled```
```systemctl status tailscaled --no-pager```

2) Enable IP forwarding (required)

Temporary:

```sudo sysctl -w net.ipv4.ip_forward=1```
```sudo sysctl -w net.ipv6.conf.all.forwarding=1```


Permanent:
```
cat <<'EOF' | sudo tee /etc/sysctl.d/99-tailscale.conf
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1
EOF
sudo sysctl --system
```

3) Bring Tailscale up with subnet route
```sudo tailscale up --advertise-routes=192.168.50.0/24 --accept-dns=false```

4) Approve routes in admin console

Tailscale Admin Console:

Machines -> edge-proxy -> Subnets / Routes -> Approve

5) Client-side usage

On iPad/Windows:

connect to Tailnet

test: open http://192.168.50.223 (edge proxy)
If IP works but DNS name doesn’t:

configure DNS (MagicDNS or split DNS)

#Troubleshooting checklist

tailscale status

tailscale netcheck

confirm route is approved

confirm edge-proxy can reach LAN IPs

confirm firewall allows return traffic