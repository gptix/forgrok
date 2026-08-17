# BOOT.md — Session Start for Grok

**Purpose**  
This file is the single entry point for a new chat session.  

When the operator says “Hello Grok! Please visit https://github.com/gptix/forgrok/blob/main/BOOT.md”, Grok should read this file and the files it points to before doing substantial work.

**Last updated**: 2026-08-07

---

## 1. Who / What this is

- Operator: George Taylor (Marietta / Cobb County, GA)
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
| 08-skills/ | Reusable skill nodes (how-to processes for KB management and projects) |
| `99-archive/` | Superseded material |

Working copy lives on the X230. All structural changes are made there, committed in small logical units, and pushed to GitHub.

---
## 3. Current project state

**Detailed living snapshot:** **STATUS.md**

High-level summary (2026-08-17):

- Withnail / Hermes on hermes-pi operational (local model + persistent SOUL working)
- Knowledge base reorganization complete; STRUCTURE.md is authoritative
- **Skill System** now active under `08-skills/`
  - Live skills: CaptureLessonLearned, CreateNewSkill, GenerateTsuiokuNodeText, SkillsIndex, UpdateProjectStatus, VoightKampffSessionClose
  - Learning cycle (Capture → Refine → Promote) has executable entry points
- Voight-Kampff Protocol updated to **v4.1** (Session Action Review is now mandatory)
- Selective knowledge exposure to Withnail continues

See **STATUS.md** for the full operational dashboard and open items.

## 4. Key files to load when deeper context is needed

| Need                              | File                                      |
|-----------------------------------|-------------------------------------------|
| Living operational snapshot       | STATUS.md                                 |
| Full structure                    | STRUCTURE.md                              |
| Voight-Kampff protocol (v4.1)     | `01-core/memory/voight-kampff-protocol.org` |
| Executable V-K skill              | `08-skills/VoightKampffSessionClose.org`  |
| Skills index                      | `08-skills/SkillsIndex.org`               |
| Skill System project              | `03-projects/skill-system-improvement/`   |
| Master memory mirror              | `01-core/memory/joji-grok-project-memory.org` |
| Org-roam NODE-NAME convention     | `01-core/principles/org-roam-node-name-convention.org` |
| Finalize helper                   | `02-infrastructure/emacs/forgrok-org-helpers.el` |

---

## 5. Operator preferences (permanent)

- Always use **Emacs** (TRAMP for remote). Never suggest nano, vi, or other editors.
- **Org-roam NODE-NAME convention**: Always use PascalCase with no spaces, hyphens, or underscores (e.g. `OrgRoamNodeNameConvention`, `HighProteinContent`). Canonical definition lives at `01-core/principles/org-roam-node-name-convention.org`. Mandatory for all new nodes.
- Prefer precise, actionable commands and org-mode checklists.
- Prefer small, focused git commits.
- Never commit secrets, API keys, or large binary backups.
- Prefer local / air-gapped solutions; treat external calls as exceptional.
- When giving shell commands, clearly state which machine they are for (X230 vs hermes-pi).
- Skills for knowledge-base and project tasks live under 08-skills/ and should be preferred over re-deriving processes from scratch.
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

- For day-to-day or session-level status changes → update **STATUS.md**
- Only update Section 3 of this file when the high-level summary itself needs to change
- When the top-level structure changes, update STRUCTURE.md and point here
- Do not put secrets or long logs in this file
