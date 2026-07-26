#+TITLE: 2026-06-05 Withnail Airgapped Agent — Skill/Tool Control, LLM Choice & Responsiveness
#+ROAM_TAGS: withnail hermes ollama zho airgap telegram performance
#+DATE: [2026-06-05]
#+PROPERTY: SESSION_SOURCE 2026-06-05-grok-session-clean.md (inbox)

* Context

This node captures synthesis from the 2026-06-05 session focused on hardening Withnail as a mostly-airgapped autonomous CEO agent on the Raspberry Pi 5 (8 GB). The session occurred while debugging performance issues and was later ingested after HTML → pandoc cleaning.

Primary goals discussed:
- Better selection and control of skills/tools available to Withnail.
- Choice of optimal LLM (via Ollama) that balances capability with low resource use.
- Configuration of Hermes + Withnail layers so the agent remains effective yet responsive to infrequent Telegram pings without constant high load.

* Observed Issues

- Repeated debugging pattern: model/quant changes triggered by OOM and context-length errors on Pi 5 8 GB hardware during tool-using reasoning.
- Tension between model power (needed for good planning and tool use) and the desire for low latency + low idle resource consumption.
- Uncontrolled or overly broad tool/skill access appears to contribute to context bloat.

* Configuration Goals (Airgapped Posture)

- Curated, bounded set of skills and tools that Withnail is permitted to invoke.
- Right-sized LLM (smaller, well-quantized) that still supports reliable tool calling and reasoning within the hardware limits.
- Event-driven activation (primarily via Telegram pings) rather than always-on heavy processes.
- Explicit context and tool-use budgets to prevent runaway resource consumption.
- Maintain strong air-gapped discipline (minimal outbound traffic; apt and Telegram only when required).

* Recommended Next Actions

1. Define and document a minimal approved skill/tool set for Withnail (ZHO-aligned).
2. Test candidate smaller/quantized models in Ollama on hermes-pi with realistic tool-use workloads.
3. Implement or refine context-length and tool-call throttling inside Hermes/Withnail.
4. Improve Telegram gateway responsiveness for infrequent pings (cron + efficient wake path).
5. Capture successful configuration as a new baseline in hermes-pi/baselines/.
6. Create or update ZHO task list items for the above.

* Open Questions

- Which specific smaller models/quantizations have shown the best trade-off between capability and stability on this hardware so far?
- What is the current mechanism (or desired mechanism) for Withnail to declare or be granted permission to use particular skills/tools?
- How should we measure “responsiveness to infrequent pings” (latency targets, success rate, resource delta)?

* Related

- [[file:~/org-roam/zho/withnail.org][Withnail node]]
- [[file:infrastructure/pi/hermes-pi/LATEST.org][hermes-pi LATEST baseline]]
- [[file:wake-up][wake-up status file]]

* Notes

This node was generated from the cleaned session file after HTML pre-processing. The original long debugging transcript was only partially represented in the ingested Markdown; the synthesis above prioritizes forward configuration work over retrospective command replay.
