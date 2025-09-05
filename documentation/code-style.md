# Code Style (Repository-Consolidated)

This summarizes pragmatic style rules inferred from the existing codebase and enforced by the local helper script `apps/codestyle/codestyle-cpp.py`. There is no remote CI pipeline; run the script locally to keep consistency with upstream AzerothCore standards.

## Formatting & Whitespace

- Indentation: 4 spaces, no tabs (script flags raw tab characters).
- Max one consecutive blank line (script rejects multiple, including at EOF).
- No trailing whitespace at line ends.
- Place closing braces aligned vertically with the opening construct.

## Braces & Control Flow

- `if`, `else`, `for`, `while`, `switch` opening brace on a new line (script enforces: no leading/trailing braces on same line patterns like `if (...) { ...` inline multi-line forms flagged by regex).
- Space between keyword and opening parenthesis: `if (condition)` (script rejects `if(` and also malformed spacing ` if ( ` patterns in certain contexts).

## Declarations & Qualifiers

Preferred qualifier ordering (as enforced):
- References: `auto const& var` (NOT `const auto&`).
- Pointers: `TypeName const* ptr` (NOT `const TypeName*`).

Use `auto` only where type is obvious from initializer; keep explicit types for clarity with complex expressions.

## Type Identification Helpers

Avoid raw `GetTypeId()` comparisons. Use semantic helpers:
- `IsItem()` instead of `GetTypeId() == TYPEID_ITEM`.
- `IsCreature()` instead of `GetTypeId() == TYPEID_UNIT`.
- `IsPlayer()`, `IsGameObject()`, `IsDynamicObject()` similarly.

## GUID Handling

Do NOT use `ObjectGuid::GetCounter()` in new code unless required by DB schema enumerations. Prefer `ObjectGuid::ToString()` for logging / display; when binding to statements expecting numeric low-part, existing code pattern may still use counter—evaluate per statement definition.

## Flags Helpers

Prefer accessor helpers over manual flag bit operations:
- NPC flags: `GetNpcFlags()`, `HasNpcFlag()`, `SetNpcFlag()`, `RemoveNpcFlag()`, `ReplaceAllNpcFlags()`.
- Item instance flags: `IsRefundable()`, `IsBOPTradable()`, `IsWrapped()`.
- Item template flags: `HasFlag(ItemFlag)`, `HasFlag2(ItemFlag2)`, `HasFlagCu(ItemFlagsCustom)` instead of raw `Flags & ITEM_FLAG_...`.

## Semicolons & Syntax Hygiene

- Avoid double semicolons `;;` (script check present).
- Maintain consistent trailing commas only in enum blocks where appropriate (follow existing patterns).

## Logging

Use structured logging macros with category string:
```cpp
LOG_INFO("entities.player", "Player {} did something", player->GetName());
```
Select the narrowest category available; fall back to `server` or root if none.

## Naming

- Classes: `PascalCase` (e.g., `PlayerScript`).
- Methods / functions: `CamelCase` (`GetAverageItemLevel`).
- Local variables: `camelCase` short but descriptive.
- Constants / enum values: `ALL_CAPS_WITH_UNDERSCORES` (upstream convention).
- Script class names often `<feature>_commandscript` (lower snake) to mirror file name; acceptable divergence from class PascalCase due to upstream legacy—follow established pattern in that directory for new command scripts.

## Includes

Order (approximate):
1. Corresponding header.
2. Core public headers (Chat, Player, WorldSession, ObjectMgr...)
3. STL / system headers.
4. Local module headers.

Avoid unused includes; rely on forward declarations where feasible (see many headers forward-declaring `class Player;`).

## Error Handling

Return early on invalid state. Use `bool` returns for command handlers to signal success/failure; log at appropriate level for unexpected failures.

## Modern C++ Usage

Core code mostly adheres to C++17 baseline (verify actual standard in CMake). Constraint: Keep compatibility and avoid introducing heavy template metaprogramming or C++20-only features unless build system updated.

## SQL & Database Layer

Use prepared statements; avoid constructing raw SQL strings with concatenation. Named statement enums centralize SQL definitions.

## Commit Discipline

Although not enforced automatically, follow conventional commit style (seen in changelog: `feat`, `fix`, `chore`, etc.).

## Local Review Checklist

- Run `python apps/codestyle/codestyle-cpp.py` locally.
- Ensure build succeeds with no newly introduced warnings (treat new warnings as errors where practical).
- Register new scripts and test in-game or via unit tests under `src/test`.

## Deviations / Legacy Exceptions

Some legacy files may violate ordering or brace placement; do not replicate outdated patterns—conform to enforced script rules.

## Future Enhancements (Optional)

Potential automation: integrate clang-format with a configuration approximating these rules; ensure it doesn't conflict with custom checks before adoption.
