# Edge Proxy (NGINX)

This folder stores the reverse proxy configuration pattern used in the homelab.

## Folder intent
- `sites-available/` : source of truth vhost configs
- `sites-enabled/`   : symlinks to enabled sites (Linux-style)

## Deployment model
On the `edge-proxy` VM/CT:
- copy files from this repo into `/etc/nginx/sites-available/`
- symlink into `/etc/nginx/sites-enabled/`
- reload nginx

## Standard upstream pattern
Each service gets:
- one server block for `<service>.homelab.internal`
- proxy_pass to service IP:port
- common headers preserved
