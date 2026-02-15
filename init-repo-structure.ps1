param(
  [string]$RepoName = "self-hosted-private-cloud"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Create repo folder at current location
$root = Join-Path -Path (Get-Location) -ChildPath $RepoName

Write-Host "Repo root: $root"

# All directories to create
$dirs = @(
  "docs",
  "inventory",
  "infrastructure/proxmox",
  "infrastructure/networking",
  "infrastructure/tailscale",
  "platform/edge-proxy-nginx/sites-available",
  "platform/edge-proxy-nginx/sites-enabled",
  "platform/dns",
  "platform/k8s/talos",
  "platform/k8s/manifests",
  "monitoring/prometheus/targets",
  "monitoring/prometheus/rules",
  "monitoring/grafana/dashboards",
  "monitoring/grafana/datasources",
  "monitoring/exporters",
  "services/dashboard",
  "services/uptime-kuma",
  "services/nextcloud",
  "services/portainer",
  "services/password-manager",
  "scripts"
)

# All files to create
$files = @(
  "README.md",
  ".gitignore",

  "docs/architecture.md",
  "docs/network.md",
  "docs/services.md",
  "docs/monitoring.md",
  "docs/tailscale.md",
  "docs/boot-order.md",

  "inventory/hosts.example.yml",
  "inventory/ip-plan.example.md",
  "inventory/dns-records.example.md",

  "infrastructure/proxmox/vm-lxc-list.md",
  "infrastructure/proxmox/boot-order.md",
  "infrastructure/networking/vlans.md",
  "infrastructure/networking/udm-pro-rules.md",
  "infrastructure/tailscale/subnet-router.md",
  "infrastructure/tailscale/acl.example.json",

  "platform/dns/powerdns-records.md",

  "monitoring/prometheus/prometheus.yml",
  "monitoring/exporters/node-exporter.md",
  "monitoring/exporters/proxmox.md",

  "scripts/backup-configs.ps1",
  "scripts/sanitize.ps1",
  "scripts/quick-status.ps1"
)

# Create root
New-Item -ItemType Directory -Path $root -Force | Out-Null

# Create directories
foreach ($d in $dirs) {
  $p = Join-Path $root $d
  New-Item -ItemType Directory -Path $p -Force | Out-Null
  Write-Host "DIR  : $d"
}

# Create files
foreach ($f in $files) {
  $p = Join-Path $root $f
  if (-not (Test-Path $p)) {
    New-Item -ItemType File -Path $p -Force | Out-Null
    Write-Host "FILE : $f"
  } else {
    Write-Host "SKIP : $f (exists)"
  }
}

# Write .gitignore content
$gitignorePath = Join-Path $root ".gitignore"
@"
# secrets
*.key
*.pem
*.p12
*.pfx
*.env
.env*
secrets/
**/secrets/
**/*token*
**/*password*

# logs
*.log
*.dump

# OS
.DS_Store
Thumbs.db
"@ | Set-Content -Path $gitignorePath -Encoding UTF8

Write-Host "`n✅ DONE. Created repo structure in: $root"
Write-Host "Next:"
Write-Host "cd `"$RepoName`""
Write-Host "git init"
Write-Host "git add ."
Write-Host "git commit -m `"Initial structure`""
