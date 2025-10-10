# DATU Stellar Fork Environment

This directory provisions a private Stellar network that mirrors the DATU consensus requirements.
It relies on the official [`stellar/quickstart`](https://github.com/stellar/quickstart) container
so the team can iterate quickly without compiling `stellar-core` and `horizon` from source. The
configuration boots a "local" network – effectively a fork with its own history archive, root
account, and protocol timeline – and enables Soroban tooling so smart-contract engineers can
exercise the ledger.

## Prerequisites

* Docker Engine 24+
* Docker Compose plugin (bundled with recent Docker desktop/engine releases)
* At least 4 CPU cores and 6 GB RAM available for the container

Verify the tooling once Docker is installed:

```bash
docker --version
docker compose version
```

## Launching the Network

From the repository root run:

```bash
./scripts/stellar-fork/start.sh
```

The helper script automatically targets the `docker-compose.yml` file in this directory.
It provisions the `datu-stellar` container, which exposes the following endpoints on your
machine:

| Port | Service | Description |
| ---- | ------- | ----------- |
| `8000` | Horizon + Soroban RPC | JSON-RPC endpoint (`/rpc`) and Friendbot for funding test accounts |
| `11625` | Stellar Core peer | Enables peering between additional validators should you launch more nodes |
| `11626` | Stellar Core admin | HTTP admin interface for ledger and quorum inspection |

Once the container reports `State: running` you can fund an account using Friendbot:

```bash
curl "http://localhost:8000/friendbot?addr=GA..."
```

The command returns a transaction hash confirming that the forked ledger created and funded
your account. Horizon’s API is available at `http://localhost:8000`, and Soroban JSON-RPC is
served at `http://localhost:8000/rpc`.

### Resetting the Network

Use the reset helper whenever you need a clean ledger snapshot:

```bash
./scripts/stellar-fork/reset.sh
```

The script shuts down the stack, removes the `datu-stellar-state` Docker volume, and relaunches
the services with pristine configuration. This keeps test runs deterministic without manually
chaining Docker commands.

## Stopping the Network

```bash
./scripts/stellar-fork/stop.sh
```

This shuts down the container but preserves ledger state inside the `datu-stellar-state`
Docker volume. Relaunching the network resumes from the last closed ledger.

## Customising the Fork

* Update files inside [`config/`](./config) to tune quorum sets, seed accounts, or Soroban flags.
  The compose file mounts specific overrides into the quickstart container:
  * [`stellar-core.cfg`](./config/stellar-core.cfg) – pins the DATU passphrase, validator roster,
    and ledger parameter tweaks.
  * [`quorumsets.toml`](./config/quorumsets.toml) – declarative description of validator tiers.
  * [`accounts.json`](./config/accounts.json) – seed account inventory for Friendbot funding.
  * [`soroban.toml`](./config/soroban.toml) – RPC and execution limits for Soroban workloads.
* `docker-compose` exports `NETWORK_PASSPHRASE="DATU Testnet 01"` so signatures are scoped to
  the DATU fork.
* To regenerate a brand-new fork manually, remove the Docker volume created by the compose file:

  ```bash
  docker volume rm datu-stellar-state
  ```

* When you are ready to promote the fork to a multi-validator topology, add additional
  services to the compose file that reference the same network passphrase but unique
  node seeds.
* Track day-to-day engineering progress for this workstream in the
  [Phase 1 checklist](./PHASE1_CHECKLIST.md), which captures the actions required to
  parameterise the network for DATU and wire it into CI/operations tooling.

## Troubleshooting

* Inspect container logs: `docker compose -f infrastructure/stellar-fork/docker-compose.yml logs -f`
* Ensure ports 8000/11625/11626 are free before starting the network.
* Reset the environment by stopping the container and removing the `datu-stellar-state` volume.
