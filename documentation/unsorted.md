# Unsorted Notes

Miscellaneous observations and TODOs collected during initial repository survey.

## Potential Documentation Enhancements

- Flesh out `npcbots-overview.md` with concrete class references.
- Add explicit security level enumeration mapping.
- Provide a quick reference for common prepared statement enum names.

## Candidate Automation

- Introduce a `clang-format` config approximating current style (ensure harmony with custom codestyle script).
- Optional Git pre-commit hook to run codestyle & basic static analysis.

## Testing Gaps

- Evaluate coverage of command handlers in `src/test` – add focused unit tests if missing.

## Performance Ideas

- Profiling: Integrate gperftools profiler toggle via config for runtime sampling during heavy load tests.

## Misc

- Confirm C++ standard version in CMake and document explicitly in `build-system.md`.
- Consider summarizing module-specific configuration variables (if any) in `modules.md`.
