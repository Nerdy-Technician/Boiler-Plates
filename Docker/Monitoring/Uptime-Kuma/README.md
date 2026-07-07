# Uptime Kuma

Self-hosted uptime and status-page monitoring.

## Quick Start

```bash
cp .env.example .env
nano .env
docker compose up -d
```

Open `http://localhost:3001` unless you changed `UPTIME_KUMA_PORT_HOST`.

## Notes

- Keep `UPTIME_KUMA_DATA_PATH` backed up; it contains monitors, users, and settings.
- Put this behind a reverse proxy for TLS if exposed beyond your LAN.
- Use notification integrations inside Uptime Kuma for email, Discord, Slack, Gotify, and similar alerts.
