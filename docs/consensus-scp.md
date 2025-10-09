---
title: Why DATU Chooses the Stellar Consensus Protocol (SCP)
description: Explains how the Stellar Consensus Protocol's federated Byzantine agreement supports DATU's citizen-led governance, performance, and resilience goals.
og_image: assets/datu-social-cover.jpg
---

# Why DATU Chooses the Stellar Consensus Protocol (SCP)

The Decentralized Accountable Trust Union (DATU) is designed to uphold public accountability while remaining responsive to the communities it serves. Selecting the right consensus protocol is core to that mission. This article explains why DATU adopts the Stellar Consensus Protocol (SCP) and offers an “explain like I’m five” (ELI5) view of Stellar’s take on Byzantine agreement.

## SCP at a Glance

SCP is Stellar’s implementation of **federated Byzantine agreement (FBA)**. Unlike proof-of-work or proof-of-stake systems that require global agreement on who may create blocks, SCP allows each participant to define their own trusted set of peers—called **quorum slices**. Consensus emerges when these slices overlap enough to form a **quorum**, ensuring that honest nodes can agree even when some participants are offline or malicious.

## Why SCP Fits DATU

### 1. Aligns with DATU’s Governance Philosophy
DATU prioritizes **citizen-led validation** and **institutional transparency**. SCP enables each institution, civil society group, or community validator to choose its own quorum slices. Overlaps between these slices create a web of trust that mirrors real-world accountability networks where citizens, watchdog organizations, and public agencies check and balance one another.

### 2. Fast, Energy-Efficient Finality
SCP reaches consensus in a matter of seconds because it does not rely on energy-intensive mining or probabilistic finality. Once a quorum agrees on a statement, it stays agreed—meaning public expenditure reports, procurement logs, or community audit entries become tamper-evident nearly instantly. This performance is crucial for DATU’s goal of providing real-time transparency dashboards without the environmental costs associated with traditional blockchain mining.

### 3. Configurable Trust and Safety
By letting participants explicitly choose their quorum slices, SCP gives DATU flexibility to reflect legal and civic realities. Government agencies can add regulatory peers, while citizen validators can include civil society groups they trust. If a validator misbehaves, stakeholders can simply remove it from their slices without forcing a hard fork, preserving network continuity and accountability.

### 4. Battle-Tested Implementation
Stellar’s production network has operated with SCP since 2015, processing millions of transactions for cross-border payments, asset issuance, and public goods distribution. Building on this proven implementation gives DATU a reliable foundation and allows teams to leverage existing tooling such as Horizon APIs, Soroban smart contracts, and mature SDKs.

## ELI5: Byzantine Agreement the Stellar Way

Imagine a neighborhood watch where every household wants to know whether it is safe to lock up for the night. Each family talks to a handful of neighbors they personally trust. If enough overlapping neighbors agree that “the street is safe,” everyone who trusts them also feels safe. Even if a few houses give bad advice or stop responding, the trustworthy ones still overlap enough for the rest of the neighborhood to reach the same conclusion.

That is Stellar’s metaphor for Byzantine agreement: **local trust circles that overlap to create global agreement**. Once a large enough overlapping group says “yes, we’re safe,” SCP records that decision and everyone moves forward together. No central guard is required, and no single family can force a false alarm if the rest of the neighborhood disagrees.

## What This Means for DATU

* **Citizen-first trust fabric** – Neighborhood-style trust lets communities anchor consensus without waiting for a central authority.
* **Rapid, dependable finality** – Public records finalize quickly, keeping transparency dashboards current.
* **Resilience against bad actors** – Misbehaving validators can be ignored by adjusting quorum slices rather than shutting down the entire network.
* **Interoperability with Stellar tooling** – DATU can adopt Stellar’s SDKs, Soroban smart contracts, and network observability tools to accelerate delivery.

By adopting SCP, DATU grounds its mission in a consensus mechanism that mirrors participatory governance: overlapping circles of trust that make tampering difficult and accountability undeniable.
