---
description: Git commit and push
agent: git-committer
---

Commit and push the staged changes.

## Commit Message Requirements

Use an appropriate prefix such as:

- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `ui:` - Interface changes
- `core:` - Core functionality changes
- `ci:` - CI/CD changes
- `ignore:` - Changes that should be ignored in release notes
- `wip:` - Work in progress

## Message Guidelines

- Explain WHY something was done from an end user perspective, not WHAT was done
- Be specific about user-facing changes
- Avoid generic messages like "improved agent experience"
- Keep it brief since messages are used for release notes

## Current Status

!`git status -s`

## Staged Changes

!`git diff --staged --stat`
