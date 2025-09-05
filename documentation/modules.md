# Modules

Modules extend core functionality and are compiled alongside the core through CMake integration (`modules/CMakeLists.txt`). Each directory under `modules/` typically corresponds to a feature set (e.g., `mod-transmog`, `mod-autobalance`).

## Structure

- `<module-root>/CMakeLists.txt` – Adds sources & include dirs.
- `<module-root>/src/` – Implementation files.
- Optional SQL, config templates, and README within the module.

## Build Integration

The top-level modules loader enumerates module directories automatically. Public headers may be aggregated via `ModulesPCH.h` to reduce compile time.

## Script Registration

Modules may introduce additional script types; ensure each `AddSC_*` function is linked into the build (usually auto when source compiled). Follow naming conventions consistent with core.

## Adding a New Module (Quick Steps)

1. Copy `modules/create_module.sh` output as a starting template.
2. Implement feature code under new folder.
3. Add C++ sources to the module `CMakeLists.txt`.
4. (Optional) Provide SQL updates (world/char) with safe naming patterns to avoid collisions.
5. Rebuild; confirm module script functions called at core start (look for log messages if added).

## Versioning & Compatibility

When core API breaks (class signature changes), adapt modules promptly. Keep changes minimal & localized; prefer feature flags rather than patching core widely.

## Performance Considerations

Group frequently modified headers into the module PCH sparingly to avoid unnecessary rebuilds. Keep heavy includes out of headers where forward declarations suffice.
