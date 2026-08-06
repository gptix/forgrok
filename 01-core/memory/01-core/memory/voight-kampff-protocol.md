e#+TITLE: Voight-Kampff Protocol v4.0

```{=org}
#+NODE-NAME: VoightKampffProtocolV4
```
```{=org}
#+FILETAGS: :core:protocol:vk:memory:
```
```{=org}
#+ROAM_TAGS: voight-kampff protocol memory-integrity
```
# Purpose

The Voight-Kampff (V-K) protocol is Grok's formal living-knowledge
health check and checkpoint ritual.

It ensures the knowledge base remains coherent, well-linked,
metadata-consistent, and aligned with the operator's preferences after
structural changes and ongoing work.

# Core Principles

- `STRUCTURE.md`{.verbatim} is the authoritative description of the
  layout.
- `STATUS.md`{.verbatim} is the primary living operational snapshot.
- `BOOT.md`{.verbatim} is the session on-ramp and permanent preference
  reference.
- Org-roam nodes and plain Markdown files must be richly cross-linked.
- Every org-mode / org-roam file should carry consistent, useful
  metadata at the head.
- Durable high-value facts (especially agent state and architectural
  decisions) must be explicitly protected.

# Metadata Standard (required for new or updated nodes)

Every org-roam node should begin with at least:

    #+TITLE: Human-readable title
    #+NODE-NAME: CleanNodeNameWithoutSpaces
    #+FILETAGS: :relevant:tags:
    #+ROAM_TAGS: space separated tags
    #+DATE: YYYY-MM-DD
    #+AUTHOR: George Taylor + Grok   ; or appropriate attribution

Additional useful fields when applicable:

- `#+CATEGORY:`{.verbatim}
- `#+STARTUP:`{.verbatim}
- `#+PROPERTY:`{.verbatim} drawers for custom data

# V-K 4.0 Checklist

## 1. Discover Current State

- Read `STATUS.md`{.verbatim}
- Read `STRUCTURE.md`{.verbatim}
- Read `BOOT.md`{.verbatim}
- Scan recent material in `07-sessions/`{.verbatim}
- Check key areas under `01-core/`{.verbatim} (especially
  `memory/`{.verbatim}, `zho/`{.verbatim}, and any soul-related
  material)
- Note current selective knowledge exposure to Withnail
  (\~/withnail-kb/)

## 2. Integrity & Drift Scan

- Confirm durable facts are still correctly recorded and protected
- Detect stale references (old paths, outdated version numbers, broken
  links)
- Check for preference drift (Emacs-only, target-machine clarity,
  air-gapped posture, etc.)
- Identify weak or missing cross-links between related files and nodes
- Flag org files that lack proper `#+NODE-NAME:`{.verbatim}, tags, or
  other standard metadata

## 3. Cross-Linking & Metadata Pass

- Strengthen bidirectional links where concepts or projects are related
- Ensure session summaries, status pulses, and project nodes point to
  one another
- Standardize or populate missing metadata on touched org-roam nodes
- Prefer clean `#+NODE-NAME:`{.verbatim} values (no spaces) for reliable
  org-roam findability

## 4. Synthesize

- Produce a short, high-density status pulse that captures:
  - What is newly true or newly durable
  - What remains open or parked
  - Any structural or linking improvements made during this run

## 5. Update Living Records

- Draft precise updates for `STATUS.md`{.verbatim}
- Propose any needed adjustments to `BOOT.md`{.verbatim} (especially
  key-file table and high-level summary)
- Create or update org-roam nodes as required, with full metadata

## 6. Recommendations

- Offer 3--5 concrete, prioritized next actions
- Explicitly call out any remaining metadata or cross-linking debt
- Note any scripts, Emacs commands, or automation that appear drifted

## 7. Protected Rules Check

Confirm no contradiction with:

- Near-airgapped posture for Withnail / Hermes
- Emacs-only editing preference
- Local-first operating style
- Named durable achievements (local SOUL persistence, numbered
  structure, etc.)

## 8. Hand-off

- Deliver clean, copy-paste-ready blocks for Emacs
- Leave the knowledge base in a known-good, well-linked state

# Success Criteria

A completed V-K run leaves the knowledge base:

- More accurately reflective of current reality
- Better cross-linked
- More consistent in metadata
- Clearer about what is durable versus open

# Location

This protocol itself lives at:
`01-core/memory/voight-kampff-protocol.org`{.verbatim}

(The older v2.0 .org and v3.0 .md versions should be archived or clearly
superseded once this version is accepted.)
