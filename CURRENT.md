# CURRENT.md — Living Operational Snapshot

**Last updated:** 2026-07-27
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

* Major reorganization complete; STRUCTURE.md + README.md are authoritative
* All transitional top-level directories cleared:
  - org-roam-knowledge/ fully dissolved (content moved to 03-projects/, 05-wiki/, etc.)
  - inbox/ → 00-inbox/ (empty)
* New project homes created this session:
  - 03-projects/arrest-demographics/
  - 03-projects/local-ai-agents/
* Remaining residual: grok-memory/exports/ (master memory files still need final placement into 01-core/memory/)

## 3. Open / Parked Items

1. Local Ollama SOUL.md loading bug (reported)
2. Final placement of grok-memory/exports/ into 01-core/memory/ and removal of grok-memory/
3. Further triage of 06-raw/ (SaveWisdomQuestions files, remaining HTML/images)
4. Controlled, selective access of KB material to Withnail
5. Brian Roemmele essay collection & ethical local-only ingestion pipeline

## 4. Recent V-K / Session Notes

* 2026-07-26: First V-K under new STRUCTURE.md; designed and landed CURRENT.md
* 2026-07-27 (morning): Finished residual org-roam-knowledge/ triage
  - Desk Set / Part 25 nodes → 05-wiki/concepts/
  - Arrest demographics research → 03-projects/arrest-demographics/
  - Lawyer AI notes → 03-projects/local-ai-agents/
  - Empty org-roam-knowledge/ directory removed

## 5. Next Actions (suggested)

* Move grok-memory/exports/ into 01-core/memory/ and delete top-level grok-memory/
* Light additional pass on 06-raw/
* Draft Voight-Kampff protocol v4.0 adapted to numbered structure
* (Later) Selective KB exposure plan for Withnail

---

*Keep this file short. Update only the sections that changed. Prefer small, focused commits.*
