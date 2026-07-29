# CURRENT.md — Living Operational Snapshot

**Last updated:** 2026-07-29  
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
* Roemmele essay ingest pipeline significantly improved (2026-07-29):
  - Full workflow documented (`roemmele-essay-ingest-workflow.org`)
  - Automated cleaner script: `scripts/clean-roemmele-essay.sh`
  - Version-controlled git hooks (`pre-commit` + `pre-push`) installed and pushed
  - How-to-install-hooks node created
* Essay 002 (40% Webpages Gone) fully processed and marked `pushed`
* Essay 001 remains `pushed`

## 3. Open / Parked Items

1. Local Ollama SOUL.md injection still broken
2. Final placement of remaining grok-memory/exports material
3. Controlled selective KB exposure plan for Withnail
4. Brian Roemmele essay collection & ethical local-only ingestion pipeline (now has solid tooling)
5. **Future:** Improve the Roemmele git hooks (stricter checks, better inventory parsing, size limits, etc.)

## 4. Recent Session Notes

* 2026-07-29: Completed end-to-end processing of Essay 002 using SingleFile → pandoc → automated clean → org-roam → inventory → push. Created reusable workflow + cleaner script + git hooks.

## 5. Next Actions (suggested)

* Install / verify git hooks on any fresh clone using the new how-to node
* Process next high-priority Roemmele essay (003+) with the new automated path
* (Later) Improve the git hooks
* Draft Voight-Kampff protocol v4.0 adapted to numbered structure

---

*Keep this file short. Update only the sections that changed.*
