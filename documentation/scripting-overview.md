# Scripting Overview

Scripts extend core behavior without modifying central logic extensively. All scripts inherit from `ScriptObject` (base) or specialized derivatives.

## Core Script Classes

- `CommandScript` – Registers chat commands (see `api-calls.md`).
- `PlayerScript` – Hooks player lifecycle events (login, logout, quest accept, etc.).
- `CreatureScript` – Behavior customization for specific creature entries.
- `GameObjectScript` – Interaction hooks for game objects.
- `WorldScript` – Global world state events (startup, shutdown, update ticks).
- `AuraScript` – Custom logic for spell auras (conditional effects).

(Exact names subject to upstream variants; inspect `src/server/game/Scripting/` for complete list.)

## Registration Pattern

Each script translation unit provides an `AddSC_<name>()` function invoked by the master script loader during initialization. Example:
```cpp
void AddSC_gear_commandscript() { new gear_commandscript(); }
```

## Lifecycle

1. Core initializes logging, config, DB.
2. Script loader enumerates compiled registration functions.
3. Scripts instantiate and register with internal managers.
4. Runtime dispatches events to scripts (e.g., command handlers invoked by `ChatHandler`).

## Design Guidelines

- Keep scripts stateless where practical; use services/singletons for shared data.
- Minimize DB access inside high-frequency callbacks; cache where safe.
- Validate all player pointers (disconnects can occur asynchronously).

## Adding Hooks

To add new event surfaces, extend relevant manager to broadcast and create a new script subclass interface. Maintain backward compatibility.

## Debugging Scripts

- Temporarily raise logger level for associated categories.
- Use targeted `LOG_DEBUG` entries; remove or raise to INFO/WARN after stabilization.

## Performance

Script dispatch overhead should remain minimal; avoid heavy dynamic allocations inside hot paths.
