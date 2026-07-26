# BOOT.md — Session Start for Grok

**Purpose**  
This file is the single entry point for a new chat session.  
When the operator says “Hello Grok! Please visit https://github.com/gptix/forgrok/blob/main/BOOT.md”, Grok should read this file and the files it points to before doing substantial work.

**Last updated**: 2026-07-26

---

## 1. Who / What this is

- Operator: Joji Teira (Marietta / Cobb County, GA)
- Knowledge base: `gptix/forgrok` (canonical working copy on X230 at `~/local-side/`)
- Local agent: **Withnail** (CEO/COO) running on hermes-pi (Raspberry Pi 5 8GB) via Hermes Agent + Telegram
- Primary editor: **Emacs** (never suggest nano or vi)
- Preference: local-first / near-airgapped operation; Telegram is the main external channel

---

## 2. Knowledge-base structure (read this first)

Full layout and design principles: **[STRUCTURE.md](STRUCTURE.md)**

High-level map:

| Path | Purpose |
|------|---------|
| `01-core/` | Stable knowledge, memory protocols, ZHO doctrine, agent identity |
| `02-infrastructure/` | Hermes-pi, hardware, tools, procedures, scripts |
| `03-projects/` | Active projects (Withnail, etc.) |
| `04-sources/` | Curated high-protein external content (Roemmele, Wilhelm, …) |
| `05-wiki/` | Wikified concepts, graphs, indexes |
| `06-raw/` | Unprocessed material |
| `07-sessions/` | Selected session exports |
| `99-archive/` | Superseded material |

Working copy lives on the X230. All structural changes are made there, committed in small logical units, and pushed to GitHub.

---

## 3. Current project state (high level, 2026-07-26)

**Withnail / Hermes on hermes-pi**
- Hermes Agent restored and running
- SOUL.md (Withnail identity) works via OpenRouter free model
- Local Ollama SOUL.md injection is broken (bug reported to Nous Research)
- Telegram bot `@WithnailRobot` is live and responding as Withnail
- Systemd user service `hermes-gateway.service` is enabled (survives reboot)
- Skills heavily reduced for air-gapped operation

**Knowledge base**
- Major reorganization completed (old `groki/` dissolved)
- `STRUCTURE.md` + new `README.md` written
- Light cleanup of `06-raw/` and start of `99-archive/` pass done

**Open / parked items**
- Local Ollama SOUL.md loading bug (reported)
- Further cleanup of remaining raw / archive material
- Controlled access of selected knowledge-base material to Withnail
- Brian Roemmele essay collection & ingestion pipeline (ethical, local-only)

---

## 4. Key files to load when deeper context is needed

| Need | File |
|------|------|
| Full structure | `STRUCTURE.md` |
| Voight-Kampff protocol | `01-core/memory/voight-kampff-protocol.org` (or `.md`) |
| Master memory mirror | `01-core/memory/joji-grok-project-memory.org` |
| ZHO index | `01-core/zho/zho-index.org` |
| Hermes-pi procedures | `02-infrastructure/hermes-pi/procedures/` |
| Withnail project | `03-projects/withnail/` |

---

## 5. Operator preferences (permanent)

- Always use **Emacs** (TRAMP for remote). Never suggest nano, vi, or other editors.
- Prefer precise, actionable commands and org-mode checklists.
- Prefer small, focused git commits.
- Never commit secrets, API keys, or large binary backups.
- Prefer local / air-gapped solutions; treat external calls as exceptional.
- When giving shell commands, clearly state which machine they are for (X230 vs hermes-pi).

---

## 6. Session close — Voight-Kampff (summary)

Full protocol: `01-core/memory/voight-kampff-protocol.org`

At session end (or when the operator says “Voight-Kampff”):

1. **Synthesize** current state from the knowledge base.
2. **Propose** concrete next actions.
3. **Log** a short pulse / entry (or prepare text the operator can append).
4. **Check** for broken links, stale inventory, or preference drift if time allows.
5. Offer a clean hand-off so the next session can start from a known good state.

The living knowledge base is the source of truth; this BOOT file is only the on-ramp.

---

## 7. How to update this file

Keep `BOOT.md` short.  
When major project status changes, update section 3.  
When the top-level structure changes, update `STRUCTURE.md` and point here.  
Do not put secrets or long logs in this file.
