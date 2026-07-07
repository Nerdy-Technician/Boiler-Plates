#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$ROOT_DIR"

failures=0

log() {
  printf '[validate] %s\n' "$1"
}

fail() {
  printf '[validate] ERROR: %s\n' "$1" >&2
  failures=$((failures + 1))
}

yaml_check() {
  log "checking YAML syntax"
  while IFS= read -r -d '' file; do
    python3 - "$file" <<'PY'
import sys
import yaml

path = sys.argv[1]
with open(path, "r", encoding="utf-8") as handle:
    yaml.safe_load(handle)
print(path)
PY
  done < <(find . -path './.git' -prune -o -type f \( -name '*.yml' -o -name '*.yaml' \) -print0 | sort -z)
}

compose_config_check() {
  if docker compose version >/dev/null 2>&1; then
    log "checking Docker Compose configs"
    while IFS= read -r -d '' file; do
      dir=$(dirname "$file")
      base=$(basename "$file")
      (
        cd "$dir"
        if [ -f .env.example ]; then
          set -a
          . ./.env.example
          set +a
        fi
        docker compose -f "$base" config --quiet
      )
      printf '%s\n' "$file"
    done < <(find Docker -name 'docker-compose.y*ml' -print0 | sort -z)
  elif command -v docker-compose >/dev/null 2>&1; then
    log "checking Docker Compose configs with docker-compose"
    while IFS= read -r -d '' file; do
      dir=$(dirname "$file")
      base=$(basename "$file")
      (
        cd "$dir"
        if [ -f .env.example ]; then
          set -a
          . ./.env.example
          set +a
        fi
        docker-compose -f "$base" config --quiet
      )
      printf '%s\n' "$file"
    done < <(find Docker -name 'docker-compose.y*ml' -print0 | sort -z)
  else
    log "skipping Docker Compose config check; compose is not installed"
  fi
}

env_check() {
  log "checking compose variable coverage"
  while IFS= read -r -d '' compose_file; do
    dir=$(dirname "$compose_file")
    env_file="$dir/.env.example"

    mapfile -t required_vars < <(
      grep -Eoh '\$\{[A-Za-z_][A-Za-z0-9_]*\}' "$compose_file" \
        | sed -E 's/^\$\{([A-Za-z_][A-Za-z0-9_]*)\}$/\1/' \
        | sort -u
    )

    mapfile -t optional_vars < <(
      grep -Eoh '\$\{[A-Za-z_][A-Za-z0-9_]*:-[^}]*\}' "$compose_file" \
        | sed -E 's/^\$\{([A-Za-z_][A-Za-z0-9_]*):-.*\}$/\1/' \
        | sort -u
    )

    if [ "${#required_vars[@]}" -eq 0 ]; then
      continue
    fi

    if [ ! -f "$env_file" ]; then
      fail "$compose_file uses required env vars but $env_file is missing"
      continue
    fi

    for var in "${required_vars[@]}"; do
      if printf '%s\n' "${optional_vars[@]}" | grep -qx "$var"; then
        continue
      fi
      if ! grep -Eq "^${var}=" "$env_file"; then
        fail "$env_file is missing $var used by $compose_file"
      fi
    done
  done < <(find Docker -name 'docker-compose.y*ml' -print0 | sort -z)
}

filename_check() {
  log "checking template filenames"
  if find Docker -name '.env-example' | grep -q .; then
    find Docker -name '.env-example' -print >&2
    fail "use .env.example instead of .env-example"
  fi
}

if [ "${CHECK_ENV_ONLY:-0}" = "1" ]; then
  env_check
  filename_check
elif [ "${CHECK_YAML_ONLY:-0}" = "1" ]; then
  yaml_check
else
  yaml_check
  compose_config_check
  env_check
  filename_check
fi

if [ "$failures" -gt 0 ]; then
  printf '[validate] failed with %s issue(s)\n' "$failures" >&2
  exit 1
fi

log "all checks passed"
