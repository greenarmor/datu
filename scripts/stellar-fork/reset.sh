#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
COMPOSE_FILE="${ROOT_DIR}/infrastructure/stellar-fork/docker-compose.yml"
VOLUME_NAME="datu-stellar-state"

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

printf 'Stopping DATU Stellar stack...\n'
"${DOCKER_COMPOSE[@]}" -f "$COMPOSE_FILE" down --remove-orphans --volumes

if docker volume inspect "$VOLUME_NAME" >/dev/null 2>&1; then
  printf 'Removing persistent volume %s...\n' "$VOLUME_NAME"
  docker volume rm "$VOLUME_NAME" >/dev/null
fi

printf 'Bootstrapping fresh state...\n'
"${DOCKER_COMPOSE[@]}" -f "$COMPOSE_FILE" up -d
"${DOCKER_COMPOSE[@]}" -f "$COMPOSE_FILE" ps
