# Logging (Condensed Summary)

Full detailed reference lives in `doc/Logging.md`. This summary captures key operational aspects for quick recall.

## Concepts

- Logger: Named category (hierarchical using dot notation). Example: `entities.player.character`.
- Appender: Output destination (Console, File, DB).
- Level ordering: `FATAL < ERROR < WARN < INFO < DEBUG < TRACE` (DISABLED disables).

## Configuration Keys

- `Logger.<name>=<LevelInt>,<AppenderNames...>` (space-separated appender list)
- `Appender.<name>=Type,LevelInt,Flags[,opt1[,opt2]]`

### Appender Types

1 = Console, 2 = File, 3 = DB.

### Common Flags

1 timestamp, 2 log level, 4 filter type, 8 datetime suffix to filename, 16 backup existing file.

### Example

```ini
Appender.Console=1,5,6
Appender.Server=2,4,15,Server.log,w
Logger.root=3,Console Server
```

## Color Configuration (Console)

`"fatal error warn info debug trace"` numeric sequence; example: `"1 9 3 6 5 8"`.

## Hierarchy

If a specific logger is not defined, it inherits from the closest ancestor; ultimately from `root`.

## Usage in Code

```cpp
LOG_ERROR("guild", "Guild {} created", guildId);
LOG_INFO("entities.player.character", "Player {} logged in", playerName);
```

## Troubleshooting

- No output? Ensure `Logger.root` defined or default fallback not disabled.
- Missing category lines: Add `Logger.<category>` or rely on ancestor.
- Excessive noise: Lower appender level or logger level (e.g., switch from DEBUG to INFO).

## Best Practices

- Use granular categories (`sql.dev`, `entities.player`) during debugging; remove or raise level when done.
- Avoid logging inside tight loops at TRACE in production.
