# BOOT.md — Session Start for Grok

**Purpose**

This file is the single entry point for a new chat session.

When the operator says “Hello Grok! Please visit https://github.com/gptix/forgrok/blob/main/BOOT.md”, Grok should read this file and the files it points to before doing substantial work.

Use `08-skills/InspectGitHubState.org` for any later claim about what is or is not on GitHub. Exact-path fetch only; never treat a summarized tree as proof of absence.

**Last updated:** 2026-09-01

---

## 1. Who / What this is

- Operator: George Taylor (Marietta / Cobb County, GA)
- Knowledge base: Tsuioku, remote mirror `gptix/forgrok` (canonical working copy on X230 at `~/local-side/`)
- Local agent: **Withnail** (CEO/COO) running on hermes-pi (Raspberry Pi 5 8GB) via Hermes Agent + Telegram
- Primary editor: **Emacs** (never suggest nano or vi)
- Preference: local-first / near-airgapped operation; Telegram is the main external channel

---

## 2. Knowledge-base structure (read this first)

Full layout and design principles: **STRUCTURE.md** (authoritative directory map)

High-level map:

| Path | Purpose |
| --- | --- |
| 00-inbox/ | Temporary staging only |
| 00-meta/ | Startup and naming conventions (`STARTUP.org`) |
| 01-core/ | Stable knowledge, memory protocols, ZHO doctrine |
| 02-infrastructure/ | Hermes-pi, Emacs helpers, hardware, tools, procedures |
| 03-knowledge/ | Non-project slices (currently transcripts) |
| 03-projects/ | Active projects (Withnail, consulting, Tarot Today, etc.) |
| 04-sources/ | Curated high-protein external content |
| 05-wiki/ | Wikified concepts, graphs, indexes |
| 06-raw/ | Unprocessed material |
| 07-sessions/ | Session exports and VK summaries |
| 08-skills/ | Reusable skill nodes |
| 99-archive/ | Superseded material |

Working copy lives on the X230. All structural changes are made there, committed in small logical units, and pushed to GitHub.

`ZHO-SCHEMA.md` and `01-core/principles/GROK-SCHEMA.md` are historical (pre-renumbering `groki/` layout). Do not treat them as the current directory map.

---

## 3. Current project state

**Detailed living snapshot:** **STATUS.md**

High-level summary (2026-08-31):

- Withnail / Hermes on hermes-pi last documented as operational (Hermes 0.19.0, local `qwen2.5-3b-64k`, persistent SOUL, Telegram `@WithnailRobot`). Runtime not re-verified this session.
- Numbered knowledge-base layout is authoritative in STRUCTURE.md; orientation files synchronized 2026-08-31
- **Skill System** active under `08-skills/`. Live skills: CaptureLessonLearned, CreateNewSkill, GenerateTsuiokuNodeText, InspectGitHubState, PiWhisperTranscription, RubyResearchLoop, SkillsIndex, UpdateProjectStatus, VoightKampffSessionClose
- Voight-Kampff Protocol is at **v4.1+**; the executable skill is the source of truth
- Roemmele / 5000 Days essays **001–008** ingested on GitHub (`008` = Saving Your Wisdom, 2026-08-25)
- Private AI Agent Consulting underway (Atlanta professional-services segments drafted 2026-08-22)
- EmacsObsidianSkin project initiated 2026-08-23
- Tarot Today identification MVP lives on Hugging Face; paid-vision retest still blocked on OpenRouter credits as of last STATUS pulse

See **STATUS.md** for the full operational dashboard and open items.

---

## 4. Key files to load when deeper context is needed

| Need | File |
| --- | --- |
| Living operational snapshot | STATUS.md |
| Full structure | STRUCTURE.md |
| GitHub inspection without false-absence | 08-skills/InspectGitHubState.org |
| Voight-Kampff protocol (background) | 01-core/memory/voight-kampff-protocol.org |
| **Executable V-K skill (source of truth)** | 08-skills/VoightKampffSessionClose.org |
| Skills index | 08-skills/SkillsIndex.org |
| Status-update skill | 08-skills/UpdateProjectStatus.org |
| New-node text format | 08-skills/GenerateTsuiokuNodeText.org |
| Skill System project | 03-projects/skill-system-improvement/ |
| Master memory mirror | 01-core/memory/joji-grok-project-memory.org |
| Org-roam NODE-NAME convention | 01-core/principles/org-roam-node-name-convention.org |
| Finalize helper | 02-infrastructure/emacs/forgrok-org-helpers.el |
| Naming / workflow conventions | 00-meta/STARTUP.org |

---

## 5. Operator preferences (permanent)

- Always use **Emacs** (TRAMP for remote). Never suggest nano, vi, or other editors.
- **Org-roam NODE-NAME convention**: PascalCase with no spaces, hyphens, or underscores (e.g. `OrgRoamNodeNameConvention`, `HighProteinContent`). Canonical definition: `01-core/principles/org-roam-node-name-convention.org`. Mandatory for all new nodes.
- New Tsuioku nodes start with `#+PROPOSED_PATH:` and `#+COMMIT_MSG:` as defined by `GenerateTsuiokuNodeText` and `my/org-roam-finalize-place-id-commit` (`C-c n F`). No leading `:PROPERTIES:` drawer — the helper creates the file-level ID.
- Prefer precise, actionable commands and org-mode checklists.
- Prefer small, focused git commits.
- Never commit secrets, API keys, or large binary backups.
- Prefer local / air-gapped solutions; treat external calls as exceptional.
- When giving shell commands, clearly state which machine they are for (X230 vs hermes-pi).
- Skills for knowledge-base and project tasks live under `08-skills/` and should be preferred over re-deriving processes from scratch.

---

## 6. Session close — Voight-Kampff

**Source of truth:** `08-skills/VoightKampffSessionClose.org`

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
