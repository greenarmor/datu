#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
COMPOSE_FILE="${ROOT_DIR}/infrastructure/stellar-fork/docker-compose.yml"

if command -v docker >/dev/null 2>&1; then
  if docker compose version >/dev/null 2>&1; then
    DOCKER_COMPOSE=(docker compose)
  elif command -v docker-compose >/dev/null 2>&1; then
    DOCKER_COMPOSE=(docker-compose)
  else
    echo "Docker Compose plugin is not installed" >&2
    exit 1
  fi
else
  echo "Docker is not installed" >&2
  exit 1
fi

"${DOCKER_COMPOSE[@]}" -f "$COMPOSE_FILE" up -d
"${DOCKER_COMPOSE[@]}" -f "$COMPOSE_FILE" ps
