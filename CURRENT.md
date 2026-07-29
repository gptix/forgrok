# CURRENT.md — Living Operational Snapshot

**Last updated:** 2026-07-28  
**Maintainer:** Joji Teira + Grok  
**Companion files:** BOOT.md (session on-ramp), STRUCTURE.md (map), 01-core/memory/joji-grok-project-memory.org (executive mirror)

---

## 1. Withnail / Hermes (hermes-pi)

- Hermes Agent **0.19.0**
- Ollama **0.32.3**
- SOUL.md identity: works via OpenRouter free model
- Local Ollama SOUL.md injection: still broken
- Telegram: @WithnailRobot live and responding as Withnail
- systemd: hermes-gateway.service (user) enabled, survives reboot
- Skills: heavily reduced for near-airgapped operation
- New baseline collector (`collect-pi-specs.sh`) deployed and tested successfully

## 2. Knowledge Base

- Numbered structure remains authoritative
- New permanent script: `02-infrastructure/hermes-pi/scripts/collect-pi-specs.sh`
- Latest baseline: `pi-withnail-specs-hermes-pi-20260728-2133.org` (+ `.sexp`)
- `LATEST.org` points to the 2026-07-28 baseline

## 3. Open / Parked Items

1. Local Ollama SOUL.md injection still broken
2. Final placement of remaining grok-memory/exports/ material
3. Controlled, selective access of KB material to Withnail
4. Brian Roemmele essay collection & ethical local-only ingestion pipeline
5. **Test Grok Build** (`03-projects/test-grok-build/`) — CLI installed, login still failing on token exchange

## 4. Recent V-K / Session Notes

- 2026-07-28 (evening): Designed, tested, and deployed improved baseline collector. Captured Hermes 0.19.0 + Ollama 0.32.3. Promoted script to permanent name in KB. Updated CURRENT.md.

## 5. Next Actions (suggested)

- **Tomorrow focus:** Test and apply as much automation as possible to the Voight-Kampff Protocol
- Draft / refine Voight-Kampff protocol v4.0 adapted to the numbered structure
- (Later) Selective KB exposure plan for Withnail

---

*Keep this file short. Update only the sections that changed. Prefer small, focused commits.*
