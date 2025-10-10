# DATU Ledger Parameter Overrides

The DATU fork layers a handful of changes on top of the default
`--local` quickstart profile so the environment behaves like the future
shared validator network. The values below are committed in
`stellar-core.cfg` for auditability.

| Parameter | Value | Local Quickstart Default | Rationale |
| --------- | ----- | ----------------------- | --------- |
| `NETWORK_PASSPHRASE` | `DATU Testnet 01` | `Standalone Network ; February 2017` (when unset) | Ensures signatures from the DATU fork are invalid on public networks. |
| `NODE_SEED` | `datu-tier1-east` keypair | Random seed baked into quickstart | Aligns the container with the validator roster defined in `quorumsets.toml`. |
| `MAX_TX_SET_SIZE` | `500` | `50` | Reserve headroom for batch treasury operations while staying within validator capacity. |

The configuration keeps `DESIRED_BASE_FEE` and `DESIRED_BASE_RESERVE`
aligned with the public network so engineers can reuse existing fee
heuristics. Adjust the table whenever the overrides evolve so operators
and compliance reviewers can trace the history.
