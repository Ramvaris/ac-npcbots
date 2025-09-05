# API Calls & Scripting Access

This document focuses on the internal C++ facing "API" relevant to command scripts and common gameplay service interactions. AzerothCore does not expose a REST HTTP API by default; instead, interaction happens through in-process C++ interfaces, chat command tables, and database prepared statements.

## Command Script API

Command scripts derive from `CommandScript` (`src/server/game/Scripting/ScriptDefines/CommandScript.h`). They override:

```cpp
std::vector<Acore::ChatCommands::ChatCommandBuilder> GetCommands() const override;
```

Example (`cs_gear.cpp`):

```cpp
class gear_commandscript : public CommandScript {
public:
    gear_commandscript() : CommandScript("gear_commandscript") {}
    ChatCommandTable GetCommands() const override {
        static ChatCommandTable gearCommandTable = {
            { "repair", HandleGearRepairCommand, SEC_GAMEMASTER, Console::No },
            { "stats",  HandleGearStatsCommand,  SEC_PLAYER,     Console::No }
        };
        static ChatCommandTable commandTable = { { "gear", gearCommandTable } };
        return commandTable;
    }
};
```

Entries map root word(s) to handlers plus required security level and console allowance.

### Handler Signature Patterns

Common forms:
- `static bool Handler(ChatHandler* handler)`
- `static bool Handler(ChatHandler* handler, Optional<PlayerIdentifier> target)`

Return `true` if the command executed successfully; `false` triggers usage/help fallback.

### Player Target Resolution

Typical pattern to allow optional explicit target or fallback to selected/self:
```cpp
if (!target) {
    target = PlayerIdentifier::FromTargetOrSelf(handler);
}
if (!target || !target->IsConnected())
    return false;
```

### Security Enforcement

Use `handler->HasLowerSecurity(targetPlayer)` before acting on other players to prevent privilege escalation.

### Messaging

- `handler->PSendSysMessage("text {}", value);` – Formatted output to invoking GM.
- `handler->needReportToTarget(player)` + secondary `ChatHandler(player->GetSession()).PSendSysMessage(...)` to notify target.

### Database Access (Prepared Statements)

Pattern (from gear stats example):
```cpp
CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHAR_STATS);
stmt->SetData(0, player->GetGUID().GetCounter());
PreparedQueryResult result = CharacterDatabase.Query(stmt);
if (result) { Field* fields = result->Fetch(); /* extract */ }
```

Key points:
- Statement enums defined centrally (search `enum CharacterDatabaseStatements`).
- Always check `result` before using.
- Use proper GUID methods (prefer `ToString()` over raw `GetCounter()` unless DB schema demands the counter id).

### Common Services / Singletons

- `sWorld` – global configuration & world state (e.g., `getIntConfig`).
- `sObjectMgr` – access templates & player data (offline operations).
- `sLog` (implicitly used via macros) – logging via `LOG_INFO(filter, fmt, ...)`.

### Logging From Scripts

Use log macros with category (logger name):
```cpp
LOG_INFO("entities.player", "Something happened to player {}", player->GetName());
```
Configure categories via `Logger.*` lines in config.

### Error Handling Guidelines

- Return `false` for incorrect usage – chat system may show help.
- Prefer early returns after validation.
- Avoid silent failure; log at `DEBUG` or `WARN` if something unexpected but non-fatal occurs.

## Prepared Statement Workflow Summary

1. Obtain prepared statement object for the proper DB (Character / World / Login).
2. Bind parameters with `SetData(index, value)` (type-safe overloads).
3. Execute with `.Query()` (expecting result set) or `.Execute()` (no results).
4. Iterate rows if multi-row (use while loop with `result->NextRow()`).

## Frequently Used Utility Classes

| Purpose | Class / Namespace |
|---------|-------------------|
| Chat command builder | `Acore::ChatCommands::ChatCommandBuilder` |
| Player identification | `PlayerIdentifier` |
| Player entity | `Player` |
| Object manager | `ObjectMgr` |
| GUID handling | `ObjectGuid` |

## Security Levels (Indicative)

- `SEC_PLAYER` – Regular players.
- `SEC_MODERATOR` / `SEC_GAMEMASTER` / `SEC_ADMINISTRATOR` – Escalating privileges. Exact enum list in security headers.

## Adding a New Command Cheat-Sheet

1. Create `cs_<name>.cpp` under `src/server/scripts/Commands/`.
2. Include required headers (`Chat.h`, `CommandScript.h`, domain headers).
3. Derive from `CommandScript`, implement `GetCommands()`.
4. Define static handler(s) with validation & permission checks.
5. Add registration function `void AddSC_<name>_commandscript()` that instantiates your script.
6. Ensure loader (ScriptLoader) includes your `AddSC_` call (core build system usually aggregates automatically if using patterns).
7. Rebuild.

## Non-Command Script Types (See `scripting-overview.md`)

Additional script classes (CreatureScript, PlayerScript, etc.) allow reacting to world events without chat invocation.

## Notes

This repository currently exposes no explicit HTTP/REST API. If automation is required, extend via an external management layer or add a REST module (keeping core isolated).
