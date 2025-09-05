# ac-npcbots Documentation Index

> Internal technical documentation for maintainers, AI assistants and contributors. This complements upstream AzerothCore docs and focuses on the specifics of this fork / module composition and coding workflow.

## Structure

- `server-basics.md` – Operating the authserver & worldserver, build, runtime layout, data extraction, config, logging.
- `api-calls.md` – Chat command scripting API shape, command table model, core service access patterns, selected DB prepared statement usage.
- `code-style.md` – Pragmatic code-style derived from existing source + enforced checks (see `apps/codestyle/codestyle-cpp.py`).
- `unsorted.md` – Collected notes not yet categorized.
- `logging.md` – Summary of logging system (condensed from `doc/Logging.md`).
- `modules.md` – Working with modules in `modules/` (load order, PCH, CMake integration).
- `build-system.md` – CMake layers, third-party deps layout, incremental build tips.
- `database.md` – Schema sources, update pipeline, Character vs World DB conventions.
- `scripting-overview.md` – ScriptObject hierarchy (CommandScript, PlayerScript, etc.) and registration lifecycle.
- `npcbots-overview.md` – Focus of this fork: NPC bots concepts (placeholder – extend when bot-specific code is analyzed in detail).

## Conventions

All new docs live in this folder. Keep `index.md` as the source of truth for file list; add new entries here when adding docs.

## Audience

1. Fast orientation for AI code agents.
2. Maintainers needing a terse refresher.
3. New contributors with prior C++ MMO emu exposure.

## Upstream References

Refer to official AzerothCore wiki for exhaustive gameplay/system documentation. This repository docs only cover deltas and local workflow.
