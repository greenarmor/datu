# DATU Stellar Fork Configuration

Drop optional overrides in this folder to customise the local fork. Files placed here are mounted
into the container at `/config` alongside the defaults provided by the `stellar/quickstart` image.

Examples:

* `quorumsets.toml` – define custom validator slices and thresholds.
* `accounts.json` – seed pre-funded accounts for integration testing.
* `soroban.toml` – toggle diagnostic flags or resource limits for contract execution.

Files are hot-loaded on container restart, so edit them, run `./scripts/stellar-fork/stop.sh`, and
start the network again to apply changes.
