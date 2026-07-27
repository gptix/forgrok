# CURRENT.md — Living Operational Snapshot

**Last updated:** 2026-07-26  
**Maintainer:** Joji Teira + Grok  
**Companion files:** BOOT.md (session on-ramp), STRUCTURE.md (map), 01-core/memory/joji-grok-project-memory.org (executive mirror)

---

## 1. Withnail / Hermes (hermes-pi)

* Hermes Agent restored and running
* SOUL.md identity: works via OpenRouter free model
* Local Ollama SOUL.md injection: broken (bug reported to Nous Research)
* Telegram: @WithnailRobot live and responding as Withnail
* systemd: hermes-gateway.service (user) enabled, survives reboot
* Skills: heavily reduced for near-airgapped operation

## 2. Knowledge Base

* Major reorganization complete (old groki/ dissolved)
* STRUCTURE.md + README.md are authoritative
* Transitional directories largely cleared:
  - `inbox/` → renamed `00-inbox/` (now empty)
  - `org-roam-knowledge/brian-roemmele/` → `04-sources/roemmele/`
  - Hermes notes → `02-infrastructure/hermes-pi/hermes/`
  - Session / chat material → `07-sessions/`
  - Desk Set / Part 25 concept nodes → `05-wiki/concepts/`
* Remaining in `org-roam-knowledge/`: `ai-tools/`, `interviews/`, `research/`, and the Fulton audit note
* `grok-memory/` still present (exports only)

## 3. Open / Parked Items

1. Local Ollama SOUL.md loading bug (reported)
2. Finish residual triage of `org-roam-knowledge/` leftovers + `grok-memory/`
3. Controlled, selective access of KB material to Withnail
4. Brian Roemmele essay collection & ethical local-only ingestion pipeline

## 4. Recent V-K / Session Notes

* 2026-07-26: First V-K under new STRUCTURE.md; designed and landed CURRENT.md
* 2026-07-26 (evening): Cleared majority of transitional top-level directories; knowledge base now largely follows the numbered structure

## 5. Next Actions (suggested)

* Finish residual triage of `org-roam-knowledge/` leftovers and `grok-memory/`
* Draft Voight-Kampff protocol v4.0 adapted to numbered structure
* (Later) Selective KB exposure plan for Withnail

---

*Keep this file short. Update only the sections that changed. Prefer small, focused commits.*
