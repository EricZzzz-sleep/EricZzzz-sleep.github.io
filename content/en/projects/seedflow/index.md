---
title: SeedFlow
summary: A seed request, inventory and order management system for Youth in Food Systems, built at CommuniHacks 2026.
date: 2026-11-08
translationKey: project-seedflow
tags:
  - Hackathon
  - Full-stack
  - Cloudflare
links:
  - type: project
    url: https://seedflow.space
    name: Live Demo
  - type: code
    url: https://github.com/CommunihacksSeed/Seedtrack
---

SeedFlow was built at **CommuniHacks 2026** for **Youth in Food Systems** (a program of Seeds of Diversity Canada), in response to Challenge 3: Seed Request, Inventory and Order Management. It replaces a manual, spreadsheet-and-notes process with one connected workflow:

**Request → Review → Inventory check → Approval (reserve) → Packing → Ready → Delivery**

- **Inventory from scratch:** physical, reserved and available stock shown side by side, low-stock alerts, CSV import/export and a full change history. Uncounted stock is never treated as zero, so it can't be allocated.
- **Request review:** imports Cognito Forms exports with validation and duplicate detection, matches requested seeds to inventory, and flags anything it can't decide instead of guessing. Approval reserves stock atomically.
- **Packing queue:** groups work by seed across all approved orders, with a printable pick list sorted by shelf and per-order packing slips.
- **Delivery routing:** geocodes drop-off addresses and plans short routes (nearest-neighbour + 2-opt), split into trips that open in Google Maps.
- **Safe under concurrency:** every inventory change is a single D1 batch guarded by compare-and-swap, tested against parallel approvals, double-clicks and a 1,000-order import.

**Tech:** Next.js (vinext) · TypeScript · Tailwind CSS · Cloudflare Workers + D1 · Zod · Vitest
