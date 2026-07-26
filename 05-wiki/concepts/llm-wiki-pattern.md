# LLM Wiki Pattern

**Ingested:** 2026-04-09 from Karpathy gist (HTML version)

## Summary
A persistent, compounding Markdown wiki that an LLM actively maintains instead of performing classic RAG on every query. Raw sources stay immutable; the wiki becomes the single source of truth.

## Key Components (Karpathy)
- `raw/` folder → immutable originals
- Wiki folder with interlinked pages
- `index.md` + `log.md` + schema file
- Ingest → Synthesize → Update index/log loop
- Optional Lint passes for consistency

## Our Implementation (Joji-Grok)
- Matches Karpathy pattern exactly
- Uses `inbox/`, `raw/`, `groki/` at `~/local-side/`
- Magit-first workflow
- Grok-native + full tool use + protected Voight-Kampff protocols
- Emacs/org-roam integration layer already in place

**Cross-references:** [[GROK-SCHEMA]], [[Joji-Grok Project Memory System]]
