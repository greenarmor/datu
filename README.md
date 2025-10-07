[![License: OGL-PH v1.0](https://img.shields.io/badge/License-OGL--PH%20v1.0-brightgreen.svg)](https://datuph.org/licence/ogl-ph-v1)
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

## Implementation Resources

The following documents outline how to materialize the DATU concept into a working platform:

* [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) – Reference architecture covering consensus, smart contracts, application layer, identity, and security.
* [`docs/IMPLEMENTATION_PLAN.md`](docs/IMPLEMENTATION_PLAN.md) – Phase-by-phase roadmap detailing activities, deliverables, and success metrics, beginning with a community-first mobilization phase where citizens shape governance, legal priorities, and collaboration tooling.
* **Documentation Portal** – MkDocs-powered site that publishes the contents of the `docs/` directory to GitHub Pages (see below for setup details).

---

## Documentation & GitHub Pages

DATU now ships with an [MkDocs](https://www.mkdocs.org/) configuration so the repository documentation can be published to GitHub Pages.

### Preview locally

```bash
pip install mkdocs
mkdocs serve
```

The development server will watch for file changes inside the `docs/` directory and rebuild the site automatically. Visit `http://127.0.0.1:8000/` in your browser to preview the rendered content.

### Continuous deployment

* A GitHub Actions workflow (`.github/workflows/documentation.yml`) installs MkDocs and runs `mkdocs gh-deploy --force` on every push to the `main` branch.
* The workflow publishes the static site to the `gh-pages` branch. Enable GitHub Pages in the repository settings and point it to the `gh-pages` branch (root) to make the documentation publicly accessible.
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
