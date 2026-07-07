# Borgmatic Backup

Scheduled Borg backups using Borgmatic.

## Quick Start

```bash
cp .env.example .env
nano .env
docker compose up -d
```

## Setup Notes

- Set `BORG_REPOSITORY` to your Borg repository.
- Set a strong `BORG_PASSPHRASE` and store it somewhere safe.
- Put SSH keys for the backup destination in `BORG_SSH_PATH`.
- Point `BACKUP_SOURCE_PATH` at the host directory you want mounted read-only into the backup container.
- Use `BORG_HEALTHCHECK_URL` for external job monitoring if you have one.

## Manual Commands

Run a backup immediately:

```bash
docker compose exec borgmatic borgmatic create --verbosity 1 --stats
```

List archives:

```bash
docker compose exec borgmatic borgmatic list
```

Restore carefully into a temporary directory first:

```bash
docker compose exec borgmatic borgmatic extract --archive latest --destination /tmp/restore
```
