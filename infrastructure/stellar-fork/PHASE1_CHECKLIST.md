# Consensus Network Foundation – Phase 1 Kickoff Checklist

This checklist tracks the immediate engineering tasks required to bring the DATU
Stellar fork online with project-specific parameters. Update the status boxes as
work completes so the broader program can see day-to-day progress without
waiting for formal documentation drops.

## 1. Repository & Environment Preparation

- [ ] Clone upstream `stellar-core` and `horizon` repositories locally for
      reference and to extract default configuration samples.
- [ ] Mirror the repositories into the DATU GitHub organization (private) so we
      can pin fork revisions for compliance review.
- [ ] Capture hardware security module (HSM) integration notes from the vendor
      and confirm signing client compatibility with Stellar Core.

## 2. Network Parameter Definition

- [ ] Draft a `NETWORK_PASSPHRASE` and ledger metadata that matches DATU naming
      conventions (e.g., `DATU Testnet 01`).
- [ ] Define the initial validator roster with tier classification, public keys,
      and quorum set weights; encode this in
      [`config/quorumsets.toml`](./config/quorumsets.toml).
- [ ] Produce a seed account inventory with intended use cases (treasury,
      integration testing, observability) and model balances in
      [`config/accounts.json`](./config/accounts.json).
- [ ] Enumerate ledger parameter deltas (ledger close time, max transactions)
      compared to Stellar public network and document rationale in commit
      messages for auditability.

## 3. Local Fork Configuration

- [ ] Extend the Docker Compose service with explicit environment variables for
      the DATU passphrase and core configuration overrides.
- [ ] Provide sample Soroban settings (`config/soroban.toml`) that reflect
      contract execution budgets required by downstream teams.
- [ ] Script a deterministic volume reset (`scripts/stellar-fork/reset.sh`) so
      engineers can wipe state between test cycles without hunting Docker
      commands.

## 4. Validator Key Management

- [ ] Generate validator keypairs inside the HSM, export public keys, and attach
      metadata (tier, owner, contact) for the governance roster.
- [ ] Verify the quickstart container can consume HSM-backed signing via the
      `SIGNING_KEY_SEED_PATH` or equivalent integration hook.
- [ ] Draft a rotation playbook covering compromised key response and annual key
      maintenance windows.

## 5. CI/CD Enablement

- [ ] Add a GitHub Actions workflow that builds the Docker image daily and runs
      health checks against the compose stack.
- [ ] Integrate Soroban contract build/test jobs so contract engineers receive
      fast feedback when pushing to shared branches.
- [ ] Publish artifact retention policies (ledger snapshots, container logs) for
      compliance and debugging.

## 6. Observability & Operations

- [ ] Attach Prometheus/Grafana sidecars or exporters to the fork to collect
      validator metrics and ledger events.
- [ ] Configure alert thresholds for ledger stalls, quorum failure, or Soroban
      execution errors and route them to the on-call channel.
- [ ] Draft an operational readiness checklist covering runbooks, paging
      rotations, and incident communication flows.

## 7. Coordination with Phase 0 Mobilization

- [ ] Link each technical deliverable above to the mobilization backlog owner so
      governance, compliance, and tooling stakeholders can review changes before
      promotion beyond local testing.
- [ ] Surface risks discovered during configuration (regulatory, procurement,
      staffing) to the joint risk register with proposed mitigations.
- [ ] Schedule twice-weekly syncs between validator engineers and mobilization
      leads until Phase 0 exit criteria are satisfied.

---

**Usage:** Keep this file in the repository to make Phase 1 progress visible to
contributors working off the codebase. Update status as tasks complete and
submit changes via pull request so the history becomes an auditable trail.
