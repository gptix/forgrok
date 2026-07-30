# CURRENT.md — Living Operational Snapshot

**Last updated:** 2026-07-30  
**Maintainer:** Joji Teira + Grok  
**Companion files:** BOOT.md, STRUCTURE.md, 01-core/memory/joji-grok-project-memory.org

---

## 1. Withnail / Hermes (hermes-pi)

* Hermes Agent restored and running
* SOUL.md identity: works via OpenRouter free model
* Local Ollama SOUL.md injection: still broken (open issues)
* Telegram: @WithnailRobot live
* systemd user service enabled
* Skills heavily reduced for near-airgapped operation

## 2. Knowledge Base

* Numbered structure remains authoritative
* **Roemmele essay ingest pipeline now mature (2026-07-30)**
  - Driver script: `scripts/ingest-roemmele-essay.sh` (pandoc + clean + skeleton)
  - Preferred flow: mechanical files (HTML + md + images) pushed first → Grok writes full org-roam node → human reviews → push org + inventory
  - Workflow documentation and driver final instructions updated to C-x C-f style
  - Pre-commit NODE-NAME space check fixed
* Essays fully processed and marked `pushed`: **001, 002, 003, 004, 005**

## 3. Open / Parked Items

1. Local Ollama SOUL.md injection still broken
2. Final placement of remaining grok-memory/exports material
3. Controlled selective KB exposure plan for Withnail
4. Continue Roemmele essay processing (006+) with the new low-friction loop
5. **Future:** Further harden Roemmele git hooks (stricter inventory parsing, size limits, etc.)

## 4. Recent Session Notes

* 2026-07-30: Major refinement of Roemmele ingest. Created higher-level driver, moved org-node authorship to Grok, fixed git-hook false positive, standardized on C-x C-f instructions. Successfully ran the complete new loop on essays 003, 004, and 005 in one session.

## 5. Next Actions (suggested)

* Continue sequential Roemmele essays (006+) using the new preferred flow
* Draft Voight-Kampff protocol v4.0 adapted to numbered structure
* (Later) Improve git hooks further

---

*Keep this file short. Update only the sections that changed.*
