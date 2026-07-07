# Stack Catalog

Use this as the quick decision guide for the templates in this repository.

## Docker Stacks

| Stack | Path | Best for | Env template | Network |
| :-- | :-- | :-- | :-- | :-- |
| MediaBox | `Docker/Media/` | Plex and media automation | `.env.example` | External `Media` |
| Borgmatic | `Docker/Backup/Borgmatic/` | Scheduled encrypted backups | `.env.example` | None |
| Homarr | `Docker/Dashboards/Homarr/` | Server dashboard | `.env.example` | External, configurable |
| Database | `Docker/Database/` | Local database lab | `.env.example` | Internal bridge |
| Monitoring | `Docker/Monitoring/` | Prometheus and Grafana starter | `.env.example` | Internal bridge |
| Uptime Kuma | `Docker/Monitoring/Uptime-Kuma/` | Uptime checks and status pages | `.env.example` | Internal bridge |
| Security | `Docker/Security/` | Traefik, Watchtower, Portainer | None | Docker default |
| Vaultwarden | `Docker/Security/Vaultwarden/` | Password manager | `.env.example` | Internal bridge |
| Web | `Docker/Web/` | NGINX plus app starter | `.env.example` | Internal bridge |
| Selfhosted 365 | `Docker/Selfhosted-365/` | Nextcloud, OnlyOffice, Draw.io | Inline placeholders | External `Office` |
| Paperless-ngx | `Docker/Selfhosted-365/Paperless-ngx/` | Document management and OCR | `.env.example` | Internal bridge |

## Single-Service Media Templates

| Service | Path | Default port |
| :-- | :-- | :-- |
| Bazarr | `Docker/Media/Bazarr/` | `6767` |
| Lidarr | `Docker/Media/Lidarr/` | `8686` |
| PodGrab | `Docker/Media/PodGrab/` | `8787` |
| Prowlarr | `Docker/Media/Prowlarr/` | `9696` |
| Radarr | `Docker/Media/Radarr/` | `7878` |
| Sonarr | `Docker/Media/Sonarr/` | `8989` |
| Transmission | `Docker/Media/Transmission/` | `9091` |

## Host Configs

| Area | Path | Includes |
| :-- | :-- | :-- |
| NGINX | `Configs/NGINX/` | Single-site, multi-site, security headers |
| Apache | `Configs/Apache/` | VirtualHost examples and security headers |
| Fail2Ban | `Security/Fail2Ban/` | SSH, NGINX auth, Transmission filters |
| UFW | `Security/UFW.md` | Baseline firewall commands |
| Systemd | `Systemd/` | Generic app and Docker Compose units |

## Recommended Flow

1. Pick a stack from the catalog.
2. Copy `.env.example` to `.env` when present.
3. Replace placeholder paths, domains, ports, and secrets.
4. Create any required external network.
5. Run `make validate`.
6. Start the stack with `docker compose up -d` or `docker-compose up -d`.
