# Build System

## Overview

The project uses CMake to orchestrate core, modules, and vendored dependencies housed under `deps/`. A helper script `./acore.sh` wraps common sequences (configure, build, clean). There is intentionally no remote CI/CD; all builds and checks run locally.

## Key Files

- `CMakeLists.txt` (root) – Global project definition, options, toolchain decisions.
- `src/CMakeLists.txt` – Adds primary server, tools, and test targets.
- `modules/CMakeLists.txt` – Aggregates optional modules.
- `deps/CMakeLists.txt` – External libraries (fmt, jemalloc, OpenSSL subset, etc.).

## Typical Build Flow

1. Configuration: `cmake -B var/build -S . -DCMAKE_BUILD_TYPE=RelWithDebInfo` (abstracted by script).
2. Compilation: `cmake --build var/build --target worldserver -- -j$(nproc)` (script alias: `./acore.sh compiler build`).
3. Install/Runtime: Binaries appear under `bin/`.

## Incremental Builds

- Touching headers in widely included directories (e.g., `src/server/game/`) triggers large rebuilds; isolate changes where possible.
- Use ccache (configured under `var/ccache/`) to speed up repeated builds.

## Dependencies

Vendored to ensure reproducible builds; avoid system-wide library mismatches. Update prudently—test stability.

## Compiler Flags

Check root CMake for warnings enabled; treat new warnings seriously. Production: `-O2 -g` (RelWithDebInfo). Debug: full symbols `-O0 -g`.

## Tests

`src/test/` houses unit tests; integrate new tests when altering core behavior, especially logic in widely used managers or scripts. Execute them locally as part of manual verification (no automated pipeline).

## Adding a New Tool

Place sources under `src/tools/<toolname>/`; add to `src/tools/CMakeLists.txt` and rebuild. Provide a README in `apps/` if usage is non-trivial.

## Troubleshooting

- Link errors: Ensure module source added to CMake target.
- Missing symbol at runtime: Confirm `AddSC_*` registration function compiled.
- Long link times: Reduce template-heavy includes in headers.

## No Remote CI/CD

All GitHub Actions workflows and automated pipelines have been removed. Quality gates rely on manual local execution of:

1. `python apps/codestyle/codestyle-cpp.py`
2. Local CMake build (treat new warnings as errors where practical)
3. Relevant unit tests under `src/test/`
4. (Optional) Manual database pending update check with `acore-db-pendings`

This keeps maintenance lightweight for a single curator workflow.
