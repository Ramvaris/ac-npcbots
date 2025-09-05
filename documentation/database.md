# Database

## Schemas

Standard AzerothCore triad plus optional:
- Auth DB: accounts, bans, realm list.
- Characters DB: per-character persistent state (inventory, stats, cooldowns). Accessed via prepared statements like `CHAR_SEL_CHAR_STATS`.
- World DB: static world data (creature templates, items, quests).
- (Optional) Hotfix / Logs databases depending on configuration.

## Updates & Pending SQL

Helper binaries / scripts:
- `acore-db-pendings` / `acore-import-changelogs` manage applying outstanding world updates.
- (Optional) Local scripts under `apps/ci/` can be invoked manually for sanity checks; no automated remote verification exists.

## Prepared Statements

Central enumeration pattern (look for `enum CharacterDatabaseStatements`). Each enumerator maps to a SQL template loaded at start, enabling type-safe binding via `SetData`.

Advantages:
- Avoid SQL injection.
- Centralize schema query strings.

## Character Stats Example

```cpp
auto* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHAR_STATS);
stmt->SetData(0, player->GetGUID().GetCounter());
PreparedQueryResult result = CharacterDatabase.Query(stmt);
if (result) { /* read Field[] */ }
```

## Best Practices

- Always null-check query result.
- Prefer minimal column selection for performance.
- Batch updates where possible; avoid per-tick DB writes in gameplay loops.

## Migrations

Number and timestamp SQL files to maintain order. Keep changes additive when feasible; avoid destructive alterations without thorough migration notes.

## Backup

Routine `mysqldump --single-transaction --routines` for each schema; schedule via cron/automation.
