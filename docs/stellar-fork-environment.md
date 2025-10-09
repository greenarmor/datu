---
title: DATU Stellar Fork Environment
description: How to launch the local Stellar fork used for DATU development and testing.
og_image: assets/datu-social-cover.jpg
---

# DATU Stellar Fork Environment

To unblock engineering teams, DATU provides a runnable fork of the Stellar network that mirrors our
federated Byzantine agreement plans. The environment is backed by the official
[`stellar/quickstart`](https://github.com/stellar/quickstart) container and enables Horizon, Stellar
Core, and Soroban JSON-RPC services with a single command.

## Why this matters

* **Immediate testing** – Run consensus flows, Soroban contracts, and Horizon queries locally without
  waiting for shared infrastructure.
* **Deterministic ledger** – The fork uses a dedicated history archive and root account so changes are
  reproducible across machines.
* **Extensible topology** – Compose files can be extended to add validator tiers that match DATU’s
  quorum strategy before deploying to shared hosting environments.

## Prerequisites

Ensure Docker and the Compose plugin are installed:

```bash
docker --version
docker compose version
```

Allocate at least 4 CPU cores and 6 GB RAM for the container. The quickstart image bundles
PostgreSQL, Horizon, Stellar Core, Soroban RPC, and Friendbot, so sufficient resources keep ledger
close times predictable.

## Launch the fork

From the repository root run:

```bash
./scripts/stellar-fork/start.sh
```

The script wraps `docker compose` and targets the `infrastructure/stellar-fork/docker-compose.yml`
definition. It provisions a `datu-stellar` container with:

| Port | Service | Notes |
| ---- | ------- | ----- |
| `8000` | Horizon REST + Soroban RPC | JSON-RPC lives at `/rpc`. Friendbot funds accounts via `/friendbot`. |
| `11625` | Stellar Core peer port | Use this to connect additional validators or observers. |
| `11626` | Stellar Core admin HTTP | `GET /info` for core status, `/quorum` for quorum analysis. |

Once the container reports `State: running`, fund a new account:

```bash
curl "http://localhost:8000/friendbot?addr=GA..."
```

Horizon will return the transaction hash that created the account on the forked ledger.

## Stop the fork

```bash
./scripts/stellar-fork/stop.sh
```

State persists inside the `datu-stellar-state` Docker volume. Remove the volume to reset the ledger:

```bash
docker volume rm datu-stellar-state
```

## Custom configuration

The compose file mounts the `infrastructure/stellar-fork/config/` directory into the container at
`/config`. Drop additional configuration files here to:

* Override quorum definitions (`quorumsets.toml`)
* Seed validator keypairs or pre-funded accounts
* Toggle Soroban diagnostic settings

Extend the compose file with more services when you are ready to model DATU’s tiered validator
structure. Each new node should re-use the same network passphrase but own a distinct keypair and
persistent volume.

## Troubleshooting tips

* `docker compose -f infrastructure/stellar-fork/docker-compose.yml logs -f` streams all services.
* Ensure ports 8000, 11625, and 11626 are free before launching.
* Reset the environment by stopping the container and removing the Docker volume as shown above.

With this forked network running locally, teams can validate ledger logic, Soroban contracts, and
observability tooling ahead of wider deployments.
