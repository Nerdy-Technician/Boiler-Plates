# Vaultwarden

Lightweight Bitwarden-compatible password manager.

## Quick Start

```bash
cp .env.example .env
nano .env
docker compose up -d
```

Open `http://localhost:8088` unless you changed `VAULTWARDEN_PORT_HOST`.

## Security Notes

- Set `VAULTWARDEN_DOMAIN` to your real HTTPS URL before production use.
- Keep `VAULTWARDEN_SIGNUPS_ALLOWED=false` unless you intentionally want open registration.
- Generate `VAULTWARDEN_ADMIN_TOKEN` only if you need the admin panel.
- Back up `VAULTWARDEN_DATA_PATH`; it contains the encrypted vault database and attachments.
- Serve through HTTPS. Password managers should not be exposed over plain HTTP.
