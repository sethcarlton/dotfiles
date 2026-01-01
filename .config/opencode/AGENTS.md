# Global Agent Rules

## General Rules

In all interactions, plans, and commit messages, be extremely concise and sacrifice grammar for the sake of concision.

## Dev Processes in tmux

**ALWAYS run watch mode processes (dev servers, tests, etc) in tmux sessions.** This allows:
- Non-blocking execution - lets the agent move on while stuff runs in background instead of sitting there waiting
- Persistent sessions - keeps dev servers running and preserves test output context instead of constantly restarting
- Checking output anytime by reading the tmux pane buffer
- Handling interactive CLIs properly

Use project-specific session names: `{project}_dev`, `{project}_test`

Before starting, check if already running:
```bash
SESSION="$(basename "$PWD" | tr '.' '-')_dev"
tmux ls 2>/dev/null | grep -q "^${SESSION}:" && echo "exists" || echo "not found"
```

If exists, read its output instead of restarting. DON'T kill and recreate unless explicitly needed.

If not exists, create detached session:
```bash
SESSION="$(basename "$PWD" | tr '.' '-')_dev"
tmux new-session -d -s "$SESSION" 'bun run dev'
```

Check session output anytime:
```bash
SESSION="$(basename "$PWD" | tr '.' '-')_dev"
tmux capture-pane -pt "$SESSION"
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
