# Docker Boilerplates

This directory contains reusable Compose templates grouped by use case.

## Layout

| Directory | Purpose |
| :-- | :-- |
| `Backup/` | Backup and restore automation |
| `Dashboards/` | Dashboard and homepage services |
| `Database/` | Database and database-admin services |
| `Media/` | Media automation and playback stacks |
| `Monitoring/` | Metrics, dashboards, and observability |
| `Security/` | Reverse proxy, updates, and container management |
| `Selfhosted-365/` | Office and collaboration services |
| `Web/` | Generic web app and reverse proxy starters |

## Standard Workflow

```bash
cd Docker/<stack>
cp .env.example .env
nano .env
docker compose up -d
```

Some examples use external Docker networks. Create those before starting the stack:

```bash
docker network create Media
docker network create Office
```

Run repository checks from the project root:

```bash
make validate
```

## Conventions

- Keep real secrets out of committed files.
- Prefer `.env.example` over inline secrets when a template has more than a few variables.
- Use image tags that are easy to override with environment variables.
- Add healthchecks where practical.
- Document external networks and required host paths.

## Featured Templates

| Template | Path | Default port |
| :-- | :-- | :-- |
| Borgmatic | `Backup/Borgmatic/` | None |
| Uptime Kuma | `Monitoring/Uptime-Kuma/` | `3001` |
| Vaultwarden | `Security/Vaultwarden/` | `8088` |
| Paperless-ngx | `Selfhosted-365/Paperless-ngx/` | `8010` |
