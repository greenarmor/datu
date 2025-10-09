---
title: Decentralized Accountable Trust Union (DATU)
description: Overview of DATU's mission, principles, vision, and documentation roadmap for building a transparent governance ledger.
og_image: assets/datu-social-cover.jpg
---

[![License: OGL-PH v1.0](https://img.shields.io/badge/License-OGL--PH%20v1.0-brightgreen.svg)](https://datuph.org)
# Decentralized Accountable Trust Union (DATU)

### A Union of Trust, Powered by Transparency.

---

## Overview

**DATU** (the **Decentralized Accountable Trust Union**) is an open blockchain framework designed to bring **transparency, trust, and accountability** into public governance and institutional systems.

By combining **decentralization** with **verifiable transparency**, DATU empowers citizens, auditors, and governments to participate in a **shared, tamper-proof ledger of truth**—with the roadmap led by a crowdsourced community and supported by enabling public institutions.

---

## Meaning

> “A unified system of trust and accountability built through decentralization.”

| Keyword | Represents | Description |
|----------|-------------|--------------|
| **Decentralized** | Openness | An open, tamper-proof foundation enabling transparency and security. |
| **Accountable** | Responsibility | Embeds public accountability into every transaction and record. |
| **Trust** | Integrity | The bridge between citizens and government—built on verifiable truth. |
| **Union** | Unity | A shared space where citizens and state work together, not apart. |

---

## Core Principles

1. **Transparency by Design** – Every transaction is visible, verifiable, and immutable.
2. **Citizen Leadership** – Everyday contributors set the platform vision and hold institutions accountable.
3. **Government as Enabler** – Public agencies facilitate legal clarity, infrastructure, and security without controlling the network.
4. **Open, Crowdsourced Governance** – Decisions and validations are community-driven, auditable, and accessible to new contributors.
5. **Global Standardization** – Designed to integrate with international transparency protocols.

---

## Vision

To establish a **global trust infrastructure** where **governments and citizens coexist transparently**, rebuilding public confidence through **open consensus and auditable governance**.

---

## Motto

> **“Transparency is not optional; it’s the foundation of trust.”**

---

## Recommended Direction

| Component | Description |
|------------|--------------|
| **Consensus Layer** | Fork of Stellar (FBA-based) for rapid, low-energy validation. |
| **Smart Contracts** | Soroban-compatible modules for policy logic and traceable disbursements. |
| **Governance Model** | Citizen-wallet participation with tiered validation roles. |
| **Token Role** | Non-speculative utility token representing transparency units, not currency. |
| **Use Case** | Government budget tracking, procurement visibility, citizen watchdog participation. |

---

## Documentation Roadmap

Review the core materials in the following order to build a shared understanding before diving into delivery work:

1. **Government Blockchain Explainer** – Strategic rationale for sovereign civic blockchains, contrasting them with speculative third-party networks and outlining why citizens and public agencies should co-own the ledger.
2. [`ARCHITECTURE.md`](./ARCHITECTURE.md) – Reference architecture covering consensus, smart contracts, application layer, identity, and security so contributors can see how the pieces fit together.
3. **Consensus – Stellar SCP Primer** – Deep dive into the Stellar Consensus Protocol (SCP) to clarify how federated Byzantine agreement upholds DATU’s accountability requirements.
4. [`IMPLEMENTATION_PLAN.md`](./IMPLEMENTATION_PLAN.md) – Phase-by-phase roadmap detailing activities, deliverables, and success metrics, beginning with a community-first mobilization phase where citizens shape governance, legal priorities, and collaboration tooling.
5. [`project-mobilization.md`](./project-mobilization.md) – Suggestion memo that alerts stakeholders to begin Phase 0 coordination activities and align on governance logistics.
6. [`project-progress.md`](./project-progress.md) – Running changelog capturing what has shipped so newcomers can quickly assess momentum and context.

The MkDocs portal mirrors this order in the navigation so readers can progress from "why" to "how" without losing context.

---

## README & Documentation Synchronization

To keep public-facing content consistent, `README.md` and `docs/index.md` must remain identical. Update `README.md` first, then mirror the changes with `cp README.md docs/index.md` (or your editor's sync command).

The documentation deployment workflow includes a validation step that fails if these files diverge, ensuring GitHub Pages always renders the latest README content.

---

## Documentation & GitHub Pages

DATU now ships with an [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) configuration so the repository documentation can be published to GitHub Pages with a built-in light/dark theme toggle.

### Preview locally

```bash
pip install mkdocs-material
mkdocs serve
```

The development server will watch for file changes inside the `docs/` directory and rebuild the site automatically. Visit `http://127.0.0.1:8000/` in your browser to preview the rendered content.

### Continuous deployment

* A GitHub Actions workflow (`.github/workflows/documentation.yml`) installs MkDocs Material and runs `mkdocs build --strict` on every push to the `main` branch, ensuring broken links fail the build.
* The resulting static site is uploaded as an artifact and published through `actions/deploy-pages` to the GitHub Pages environment. Enable GitHub Pages in the repository settings and point it to the GitHub Actions deployment source to make the documentation publicly accessible.
* Update `docs/project-progress.md` with a dated entry whenever notable work is merged so visitors can follow the project's evolution.

---

## Community Mobilization Highlights

* **Inclusive Steering Committee** – Citizen coalitions, civic-tech groups, and open-source contributors share seats with public sector advisors.
* **Participatory Legal Review** – Regulatory discussions incorporate public consultations to surface privacy and transparency priorities.
* **Open Collaboration Infrastructure** – Repositories, CI/CD pipelines, and documentation portals remain accessible for new volunteers, backed by government-provided hosting and security support.

These resources provide a starting point for forming engineering teams, scoping work, and launching pilot networks that embody the DATU principles.

---

## License

Openly developed under the **Open Government Licence – Philippines (OGL-PH v1.0)** — ensuring the system remains free, inspectable, and modifiable for civic use.

---

> **DATU – A Union of Trust, Powered by Transparency.**
>
> *Because accountability should never depend on secrecy.*

---
