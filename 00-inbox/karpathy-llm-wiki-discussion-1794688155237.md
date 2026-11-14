z# Recent Discussion on Karpathy's llm-wiki Gist

**Date range covered:** 13 October 2026 through 13 November 2026
**Source:** https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
**Author:** Eli Anderson

---

## Summary

The Oct 13 – Nov 13 period saw a flood of open-source implementations of Karpathy's three-layer wiki idea (raw / wiki / schema). Several contributors shipped real code: Lucas Alvarez released **soou** (SQLite index, standard-library Python, MIT), Chaves Liu released **Second Brain Skill**, and liushengyu released **MemexOS**. ya2080 updated **Eigma**, a free app that adds spaced-repetition quizzing on top of the wiki, and suwonleee reported experimental results showing that wiki pages alone are not enough to carry decisions into future coding sessions — prompt excerpts and runtime rule gates were both needed for reliable knowledge transfer.

Two dissenting voices stood out. hyunsoo36 reported that in practice the compiled wiki often lacked the detail needed to answer a question, so his agent still had to read the raw sources, making the wiki an extra layer without enough retrieval savings to offset its ingest cost. karlwirth argued that the wiki should be written for the human, not the agent; when running several agents at once, a richer wiki adds overhead rather than clarity, and what is needed instead is a concise record of decisions, open questions, and status summaries. sassarini-marco contributed a measured data point: 72% of LLM tokens during ingest went to routing decisions (which folder, merge or not, what to link), and offloading those decisions to a small typed classifier cut ingest time in half while raising retrieval success from 62% to 89% on a 525-document corpus.

Several comments addressed data integrity. NDOTO-G described hash-chain verification with health checks that flag when a wiki page silently diverges from its source. frankchu91 (MindBase 0.4.6) added computed (not LLM-guessed) lint checks for broken citations and broken wikilinks. francisdu53 replaced vector search entirely with a Fuzzy Cognitive Map laid over the pages, reporting five weeks of daily production use.

---

## Table (newest first)

| Contributor | Point | Message | Contributor URL |
|---|---|---|---|
| ya2080 | wiki + spaced review | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6466599) | [ya2080](https://github.com/ya2080) |
| LucasAlvarezS | open-source SQLite implementation | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6466464) | [soou](https://github.com/LucasAlvarezS/soou) |
| ChavesLiu | Second Brain Skill | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6453126) | [second-brain-skill](https://github.com/ChavesLiu/second-brain-skill) |
| liushengyu | MemexOS persistent wiki | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6452852) | [memexos](https://github.com/liushengyu/memexos) |
| hyunsoo36 | ingest cost hard to justify | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6449642) | |
| lucaslimafons | wiki from repo with citations | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6449220) | [llm-repo-wiki](https://github.com/lucaslimafons/llm-repo-wiki) |
| francisdu53 | fuzzy cognitive map over wiki | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6448248) | [exia-seed](https://github.com/francisdu53/exia-seed) |
| NDOTO-G | hash-verified health checks | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6445634) | |
| tuirk | rules + LLM hybrid wiki | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6445091) | [Kompl](https://github.com/tuirk/Kompl) |
| gowtham0992 | review-gated agent memory | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6444245) | [gowtham0992](https://github.com/gowtham0992) |
| securityguy | multiple memory types | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6441451) | |
| karlwirth | wiki for human, not agent | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6436773) | |
| gavischneider | curated implementation list | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6431021) | [awesome-llm-wiki](https://github.com/gavischneider/awesome-llm-wiki) |
| frankchu91 | computed lint checks | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6430961) | |
| sassarini-marco | 72% tokens on routing | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6427891) | |
| ya2080 | Eigma spaced review | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6426884) | [ya2080](https://github.com/ya2080) |
| vvronskyFX | confusion about spam | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6426340) | |
| suwonleee | quiz on past decisions | [comment](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#gistcomment-6425841) | [llmwiki](https://github.com/suwonleee/llmwiki) |

---

## Gaps

**Comments skipped as off-topic or spam (8 total):**
- donaldalice6-pixel (30 Oct 2026, 12 Nov 2026) — ALS herbal treatment promotion.
- leszekszczepkowski (11 Nov 2026) — asking permission for a Polish translation (meta request, not about the wiki concept).
- felixhuangfei (27 Oct 2026) — unsubscribe request.
- nancyoliver704-lgtm (22 Oct 2026) — courthouse promotion.
- wsir78933-rgb (14 Oct 2026, three comments) — Stardew Valley planner, D&D tool, and image editor promotions.

**Duplicate comment skipped (1 total):**
- ChavesLiu (27 Oct 2026, gistcomment-6446098) — repost of the same Second Brain Skill announcement made on 2 Nov 2026. Only the later (2 Nov) entry is included in the table.

**Comments that could not be opened or read:** None. The GitHub API returned all 1,166 comments across 12 pages. Every comment in the filtered set of 27 was retrieved in full; none were truncated by the API. All comments in the 13 Oct – 13 Nov range were successfully opened, read, and dated.
