# BOOT.md — Session Start for Grok

**Purpose**  
This file is the single entry point for a new chat session.  

When the operator says “Hello Grok! Please visit https://github.com/gptix/forgrok/blob/main/BOOT.md”, Grok should read this file and the files it points to before doing substantial work.

**Last updated**: 2026-08-21

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
| `03-projects/` | Active projects (Withnail, AI Agent Consulting, Tarot, etc.) |
| `04-sources/` | Curated high-protein external content (Roemmele, Koerner Office, …) |
| `05-wiki/` | Wikified concepts, graphs, indexes |
| `06-raw/` | Unprocessed material |
| `07-sessions/` | Selected session exports and VK summaries |
| `08-skills/` | Reusable skill nodes (how-to processes for KB management and projects) |
| `99-archive/` | Superseded material |

Working copy lives on the X230. All structural changes are made there, committed in small logical units, and pushed to GitHub.

---

## 3. Current project state

**Detailed living snapshot:** **STATUS.md**

High-level summary (2026-08-21):

- Withnail / Hermes on hermes-pi operational (local model + persistent SOUL working)
- Knowledge base reorganization complete; STRUCTURE.md is authoritative
- **Skill System** active under `08-skills/`
  - Live skills include: CaptureLessonLearned, CreateNewSkill, GenerateTsuiokuNodeText, SkillsIndex, UpdateProjectStatus, VoightKampffSessionClose, RubyResearchLoop
- Voight-Kampff Protocol is at **v4.1+**; the executable skill is the source of truth
- Private AI Agent Consulting project underway (Atlanta law-firm focus, Tiered packaging defined)
- `forgrok-org-helpers.el` updated with robust keyword extraction and `my/forgrok-repo-root`

See **STATUS.md** for the full operational dashboard and open items.

---

## 4. Key files to load when deeper context is needed

| Need | File |
|------|------|
| Living operational snapshot | STATUS.md |
| Full structure | STRUCTURE.md |
| Voight-Kampff protocol | `01-core/memory/voight-kampff-protocol.org` |
| **Executable V-K skill (source of truth)** | `08-skills/VoightKampffSessionClose.org` |
| Skills index | `08-skills/SkillsIndex.org` |
| Skill System project | `03-projects/skill-system-improvement/` |
| Master memory mirror | `01-core/memory/joji-grok-project-memory.org` |
| Org-roam NODE-NAME convention | `01-core/principles/org-roam-node-name-convention.org` |
| Finalize helper | `02-infrastructure/emacs/forgrok-org-helpers.el` |

---

## 5. Operator preferences (permanent)

- Always use **Emacs** (TRAMP for remote). Never suggest nano, vi, or other editors.
- **Org-roam NODE-NAME convention**: Always use PascalCase with no spaces, hyphens, or underscores (e.g. `OrgRoamNodeNameConvention`, `HighProteinContent`). Canonical definition lives at `01-core/principles/org-roam-node-name-convention.org`. Mandatory for all new nodes.
- Prefer precise, actionable commands and org-mode checklists.
- Prefer small, focused git commits.
- Never commit secrets, API keys, or large binary backups.
- Prefer local / air-gapped solutions; treat external calls as exceptional.
- When giving shell commands, clearly state which machine they are for (X230 vs hermes-pi).
- Skills for knowledge-base and project tasks live under `08-skills/` and should be preferred over re-deriving processes from scratch.

---

## 6. Session close — Voight-Kampff

**Source of truth**: `08-skills/VoightKampffSessionClose.org`

When the operator says “Voight-Kampff”, “V-K”, or at the end of a significant session, follow the skill. Do **not** invent a shorter process.

The skill currently includes (among other steps):

- Discover Current State
- Integrity & Drift Scan
- Session Action Review (mandatory)
- Cross-linking & Metadata Pass
- Synthesis + Recommendations
- Protected Rules Check
- Clean hand-off
- Emission of a VK Summary Node under `07-sessions/vk/`

Full protocol background: `01-core/memory/voight-kampff-protocol.org`

The living knowledge base is the source of truth; this BOOT file is only the on-ramp.

---

## 7. How to update this file

Keep `BOOT.md` short.

- For day-to-day or session-level status changes → update **STATUS.md**
- Only update Section 3 of this file when the high-level summary itself needs to change
- When the top-level structure changes, update STRUCTURE.md and point here
- Do not put secrets or long logs in this file
