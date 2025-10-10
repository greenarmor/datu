# DATU Stellar Fork Configuration

Drop optional overrides in this folder to customise the local fork. Files placed here are mounted
into the container at `/config` alongside the defaults provided by the `stellar/quickstart` image.

Examples:

* `stellar-core.cfg` – primary configuration consumed by the quickstart container. It pins the
  DATU network passphrase, validator roster, and ledger parameter overrides.
* `quorumsets.toml` – declarative validator tiers used by `stellar-core.cfg` for quorum assembly.
* `accounts.json` – pre-funded accounts for integration testing and observability workflows.
* `soroban.toml` – RPC limits and diagnostic toggles for Soroban execution budgets.
* `ledger-parameters.md` – human-readable summary of the deltas versus the stock quickstart
  profile.

Files are hot-loaded on container restart, so edit them, run `./scripts/stellar-fork/stop.sh`, and
start the network again to apply changes.
