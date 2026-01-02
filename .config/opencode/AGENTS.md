# Global Agent Rules

## Dev Processes in Tmux

**ALWAYS run watch mode processes (dev servers, tests, etc) in tmux windows.** This keeps them running in background without blocking.

Use descriptive window names: `dev`, `test`, `build`

If not in tmux (`$TMUX` is empty), first ensure session exists based on current directory:
```bash
SESSION="$(basename "$PWD" | tr . _)"
tmux has-session -t "$SESSION" 2>/dev/null || tmux new-session -d -s "$SESSION" -c "$PWD"
```

Before starting, check if window exists:
```bash
tmux select-window -t "$SESSION:dev" 2>/dev/null && echo "exists" || echo "not found"
```

If exists, check its output instead of restarting. If not, create it:
```bash
tmux neww -dn dev -t "$SESSION" 'bun run dev'
```

Check window output anytime:
```bash
tmux capture-pane -pt "$SESSION:dev" -S -100
```

### Turborepo

When working with Turborepo projects, **ALWAYS use the stream UI instead of the TUI** by adding `--ui=stream` flag:

```bash
turbo run dev --ui=stream
turbo run build --ui=stream

# Or when using through package.json scripts:
bun run dev -- --ui=stream
npm run dev -- --ui=stream
```

The stream UI provides readable output that works well in tmux sessions and for capturing logs, while the TUI (terminal user interface) is interactive and doesn't work well in detached sessions.

## Task Tracking

Use `bd` for task tracking. Run `bd ready` to see available tasks, `bd create` to add new tasks.

## Additional Important Instructions

In all interactions, plans, and commit messages, be extremely concise and sacrifice grammar for the sake of concision.
