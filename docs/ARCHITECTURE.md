# DATU Reference Architecture

This document translates the high-level vision in the root `README.md` into a concrete, implementable architecture for the Decentralized Accountable Trust Union (DATU).

## 1. System Goals

* **Radical transparency** for public spending and institutional activity.
* **Citizen participation** in validation and oversight without sacrificing throughput.
* **Government partnership** with clear interfaces for budget planning, execution, and audits.
* **Global interoperability** via standards-based APIs and data schemas.

## 2. High-Level Component Model

```
+------------------+       +------------------------+
| Citizen Wallets  | <---> | Civic Engagement APIs  |
+------------------+       +------------------------+
           |                              |
           v                              v
+---------------------------------------------------------+
|           Application & Integration Layer               |
|                                                         |
| +--------------------+  +-----------------------------+ |
| | Gov. Budget Portal |  | Public Transparency Portal | |
| +--------------------+  +-----------------------------+ |
|        |                           |                     |
|        v                           v                     |
| +--------------------+  +-----------------------------+ |
| | Workflow Services  |  | Analytics & Reporting Svc. | |
| +--------------------+  +-----------------------------+ |
|                    |            |                       |
|                    v            v                       |
|           +-----------------------------+                |
|           |     Soroban Smart Contracts |                |
|           +-----------------------------+                |
|                           |                               |
+---------------------------|-------------------------------+
                            v
                 +------------------------+
                 | Stellar FBA Network    |
                 | (DATU Consensus Layer) |
                 +------------------------+
```

## 3. Stellar FBA Consensus Layer

* Fork Stellar Core to create a permissioned-but-open quorum configuration focusing on public sector validators.
* **Node types**
  * *Government Nodes*: National, regional, and municipal computing centers.
  * *Citizen Auditor Nodes*: Civil society organizations that meet staking and compliance requirements.
  * *Observer Nodes*: Read-only replicas for journalists, NGOs, and watchdog groups.
* **Enhancements**
  * Custom quorum sets for hierarchical governance (see Section 6).
  * Integration with Soroban smart contract runtime for policy execution.
  * Anchored time-series storage for budget line-items and contract execution proofs.

## 4. Soroban Smart Contract Suite

| Module | Purpose | Key Functions |
| --- | --- | --- |
| `BudgetRegistry` | Tracks appropriations, releases, and obligations. | `registerBudget()`, `allocate()`, `obligate()`, `closePeriod()` |
| `ProcurementLedger` | Records procurement events, bids, awards, and deliveries. | `announceBid()`, `submitBid()`, `awardContract()`, `recordDelivery()` |
| `DisbursementTracker` | Links payment vouchers to budget items and milestones. | `createVoucher()`, `approveVoucher()`, `settleVoucher()` |
| `AccountabilityScores` | Maintains transparency metrics for agencies and participants. | `registerAuditor()`, `updateMetric()`, `issueAlert()` |
| `GovernanceVoting` | Manages proposals and votes for protocol upgrades and policies. | `submitProposal()`, `castVote()`, `finalizeVote()`, `delegateAccountability()`, `reclaimAccountability()` |

### Data Invariants

* All monetary values recorded in **Transparency Units (TU)**, a non-transferable utility token.
* Each contract emits event logs referencing immutable document hashes stored via IPFS or similar content-addressable storage.
* Role-based access enforced by Soroban authentication interfaces tied to wallet identities.

## 5. Data & Document Layer

* **Off-chain storage** for large artifacts (budgets, contracts, receipts) using IPFS/Filecoin or compliant national data centers.
* Merkle proofs stored on-chain linking to document hashes and version history.
* Public REST/GraphQL API to fetch documents, anchored with blockchain transaction references.

## 6. Governance & Quorum Configuration

* **Tiered validation roles**:
  * *Tier 0 (Core)* – National audit commissions, central banks.
  * *Tier 1* – Regional governments, accredited CSOs.
  * *Tier 2* – Citizen auditors with delegated stakes.
    *In this context “delegated stakes” refers to non-custodial accountability weight that higher-tier institutions assign to trusted citizen auditors; no personal financial collateral is required.*
    *Technical flow*: (1) a citizen registers their wallet DID and compliance credentials via the `AccountabilityScores` module; (2) a higher-tier institution signs a `delegateAccountability()` Soroban transaction that locks a quota of its validator weight to the citizen’s auditor address without transferring custody; (3) the delegation is recorded on-chain as metadata consumed by Stellar Core when building quorum slices, so the citizen node can vote with the delegated weight; (4) delegators can revoke or rotate the delegation with a `reclaimAccountability()` transaction, instantly removing the borrowed weight from the citizen’s node if misbehavior is detected. The citizen’s wallet therefore acts as the key pair for signing audit attestations while institutional capital remains in place.
    *Transparency Units stay with the delegating institution—citizen auditors need only maintain a verified wallet; they never escrow or control the underlying TU balances that back the delegated accountability weight.*
* Quorum slices require representation from at least two tiers to ratify a ledger close.
* Upgrade proposals submitted via `GovernanceVoting` contract with on-chain ballot and audit trail.

## 7. Identity & Access Management

* Wallet identities managed through DID-compatible credentials issued by government registries and verified civil organizations.
* Multi-factor authentication for operators (hardware keys + biometric or OTP).
* Selective disclosure: citizens choose what personal info is public; all audit-relevant data remains immutable.

## 8. Application Layer

### Government Budget Portal

* Secure dashboards for agencies to encode budget releases and monitor disbursements.
* Workflow engine ensures each action maps to an on-chain transaction (e.g., obligation, disbursement).

### Public Transparency Portal

* Read-only explorer for citizens with charts, alerts, and social accountability tools.
* Open data exports in CSV/JSON with machine-readable metadata.

### Civic Engagement APIs

* OAuth2-protected API for third-party watchdog apps.
* Webhooks for new procurement events, budget releases, or audit findings.

## 9. Observability & Compliance

* On-chain telemetry aggregated into Prometheus/Grafana dashboards.
* Regular Merkle root snapshots for auditing.
* Compliance workflows aligning with national procurement and auditing laws.

## 10. Security Considerations

* Hardware Security Modules (HSMs) for validator key custody.
* Formal verification of critical Soroban contracts using property-based testing frameworks.
* Continuous vulnerability scanning of node software and infrastructure.
* Incident response runbooks with on-chain signaling for emergency shutdowns.

## 11. Deployment Blueprint

1. Bootstrap genesis ledger with government and accredited civil society validators.
2. Deploy Soroban contracts with multi-signature governance oversight.
3. Launch staging network for pilot agencies and iterate on contract parameters.
4. Roll out production network with phased onboarding of agencies and citizen auditors.

## 12. Future Enhancements

* Cross-border transparency data exchange via inter-ledger protocols.
* Mobile-first citizen wallet with localized languages and accessibility features.
* AI-assisted anomaly detection on procurement and disbursement patterns.

---

This architecture document should serve as the baseline for the initial implementation milestones described in `IMPLEMENTATION_PLAN.md`.
