# Server Basics

This document gives an operational overview for running and maintaining the authserver and worldserver provided by this project (AzerothCore fork with NPC bots modules).

## Components

- Authserver: Handles account authentication & realm list. Binary: `bin/acore` (auth mode) or via wrapper script `./acore.sh run-authserver`.
- Worldserver: Core gameplay world. Launch via `./acore.sh run-worldserver`.
- Database Layer: Three principal MySQL schemas (auth, characters, world) + hotfix / logs (when enabled).
- Modules: Dynamically compiled extensions under `modules/` integrated at build time.

## Directory Layout (runtime relevant)

- `conf/` – Template config files. Actual runtime configs usually copied to `env/user/` or root build output dir.
- `data/` – DBC, maps, vmaps, mmaps, cameras, gt, etc. Produced by extraction step.
- `var/build/` – Out-of-source CMake build tree (binaries placed under `bin/`).
- `modules/` – Optional features compiled into core (loaders auto-generated).
- `apps/` – Helper tooling: codestyle, extractor scripts, (legacy) CI utility scripts usable locally.
- `doc/` – Upstream style documents (logging, changelogs).

## Build

Primary helper script: `./acore.sh` (wrapper around CMake & build steps).

Typical sequence (non-docker):
1. Configure & build: `./acore.sh compiler build`
2. (Optional) Clean: `./acore.sh compiler clean`
3. Generate server configs: `apps/ci/ci-gen-server-conf-files.sh` or manual copy from `conf/`.

### CMake

Top-level `CMakeLists.txt` + `src/CMakeLists.txt` orchestrate core. Third-party deps vendored in `deps/` (Boost subset, fmt, jemalloc, etc.). Modules appended via `modules/CMakeLists.txt`.

## Data Extraction

Extraction tools live under `src/tools/` and are built into separate executables (map/vmap/mmap extractors). Output placed under `data/`. Use provided wrapper scripts in `apps/extractor/` or community instructions (not duplicated here).

## Configuration

Key world configuration file typically: `worldserver.conf` (generated from template `conf/worldserver.conf.dist`).

Log configuration uses `Logger.*`/`Appender.*` directives (see `logging.md`).

Security levels map to enumerations controlling GM commands (e.g., `SEC_PLAYER`, `SEC_GAMEMASTER`).

## Logging

See `logging.md` summary; full reference at `doc/Logging.md`.

## Operational Tasks

- Start auth: `./acore.sh run-authserver`
- Start world: `./acore.sh run-worldserver`
- Stop: Send SIGINT (Ctrl+C) or use in-game/console `server shutdown` command.
- Reload: Many subsystems support `reload <name>` commands (DBC, config slices, locales, etc.).

## Backup Strategy (Suggested)

- Regular SQL dumps (auth, characters, world) using `mysqldump` with replication-safe flags.
- Version control `conf/` customizations separately (avoid editing `.dist` files directly).

## Performance Considerations

- jemalloc / tcmalloc can improve allocator performance (vendored gperftools).
- Enable O2 or RelWithDebInfo for production.
- Use `valgrind/` scripts for leak analysis in debug scenarios.

## Crash Handling

Core can be built with debug symbols. Collect backtraces using gdb: `gdb --batch -ex 'bt full' -p <pid>` after attaching to crashed core (if still running) or analyzing core dump (enable `ulimit -c unlimited`).

## Deployment Via Docker

- `docker-compose.yml` and `docker/` folder supply Docker build and entrypoint harness.
- Adjust volumes to mount persistent `data/` and `mysql` storage.

## NPC Bots Notes (High-Level)

This fork emphasizes NPC bots. Detailed architecture TBD in `npcbots-overview.md` (placeholder). When extending bot logic, follow core scripting patterns and encapsulate behavior under a dedicated module if feasible.

## Routine Maintenance Checklist

- Apply world DB updates (pending SQL) regularly (see `acore-db-pendings`).
- Run codestyle script before committing.
- Monitor logs for ERROR/FATAL; adjust logger levels during debugging.
- Periodically update modules to match core API shifts.
