---
title: Project Progress
description: Running changelog documenting notable updates to the DATU repository and documentation portal for contributors.
og_image: assets/datu-social-cover.jpg
---

# Project Progress

This changelog captures notable updates to the DATU repository and documentation hub. Add a dated entry whenever meaningful
work is merged so contributors can quickly review recent activity.

## 2025-10-10 – Local Stellar Fork Available

- Published a Docker Compose-powered Stellar fork so engineers can run consensus, Horizon, and
  Soroban locally via `./scripts/stellar-fork/start.sh`.
- Documented runbooks and troubleshooting guidance in the repository and documentation portal.
- Began defining follow-on work for multi-node quorum modeling and passphrase management.

## 2025-10-09 – Phase 1 Kickoff with Deferred Mobilization Wrap-up

- Authorized the consensus network team to begin Phase 1 Stellar fork work while remaining Phase 0 mobilization tasks stay in a tracked backlog.
- Published guidance in the implementation plan outlining immediate coordination checkpoints so governance, compliance, and tooling owners continue closing their deliverables during the fork.
- Established a shared risk register to monitor any blockers created by running mobilization and engineering activities in parallel.

## 2025-10-08 – Project Mobilization Suggestion Published

- Documented a mobilization suggestion memo to alert stakeholders about immediate governance and coordination actions for Phase 0.
- Linked the mobilization guidance from the documentation hub and repository overview so contributors can find it quickly.

## 2025-10-07 – Documentation Portal Foundation

- Added an [MkDocs](https://www.mkdocs.org/) configuration to publish the DATU documentation to GitHub Pages.
- Introduced a documentation homepage summarizing available resources and contribution steps.
- Created this running progress log to capture future updates across architecture, implementation planning, and community
  initiatives.
- Automated GitHub Pages deployment through a dedicated workflow that builds and pushes the site on every change to the default
  branch.
