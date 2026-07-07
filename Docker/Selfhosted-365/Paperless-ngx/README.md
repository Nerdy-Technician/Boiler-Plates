# Paperless-ngx

Document management with OCR, tags, correspondents, and automatic consumption folders.

## Quick Start

```bash
cp .env.example .env
nano .env
docker compose up -d
```

Open `http://localhost:8010` unless you changed `PAPERLESS_PORT_HOST`.

Create the first user after startup:

```bash
docker compose exec webserver python manage.py createsuperuser
```

## Paths

- `consume/` is the drop folder for new documents.
- `media/` stores originals and generated files.
- `data/` stores application state.
- `export/` is available for document exporter output.
- `postgres/` stores the database.

## Notes

- Change `PAPERLESS_SECRET_KEY` before real use.
- Set `PAPERLESS_URL` to the public HTTPS URL when reverse-proxying.
- Back up both the database and media directory.
