# Evolver Codex Hybrid

A portable Codex skill package for maintaining a local Evolver-to-Codex bridge.

This package is designed for sharing or publishing. It includes the skill entrypoint, the bridge scripts, and a bootstrap installer that creates a clean `evolver-hybrid/` workspace without copying any existing private memory, session history, or user-specific artifacts.

## What this package contains

```text
evolver-codex-hybrid/
├── README.md
├── INSTALL.md
├── install.sh
├── .gitignore
├── skills/
│   └── evolver-codex-hybrid/
│       └── SKILL.md
├── scripts/
│   ├── evolver_codex_bridge.js
│   ├── index_codex_sessions.js
│   └── record_execution_feedback.js
└── docs/
    └── evolver-codex-hybrid.md
```

## What the installer does

When you run `install.sh` against a target workspace, it will:

1. copy the skill into `<target>/.agents/skills/evolver-codex-hybrid/`
2. copy the bridge scripts into `<target>/scripts/`
3. create a clean `<target>/evolver-hybrid/` directory tree
4. write minimal placeholder files for `stable-rules`, `next-prompt`, `next-actions`, feedback logs, and debrief artifacts

The installer intentionally does not copy any existing:

- Codex session history
- private stable rules
- real execution feedback
- raw Evolver outputs
- user-specific task artifacts

## Intended use

Use this package when you want another Codex instance to:

- ingest fresh Evolver-style output into a local file-based bridge
- query stable rules, feedback, and session summaries through the bridge
- maintain promotion packets and debrief reminders
- keep bridge maintenance separate from broader retrospective reasoning

## Requirements

- Codex with workspace file access
- Node.js available in the target workspace
- a writable target project directory

## Privacy note

This publishable package is intentionally sanitized:

- no hard-coded local absolute paths
- no user names
- no private case materials
- no copied `.codex/sessions` data

## Recommended share target

If you want to publish this to GitHub, publish this folder as its own repository root.
