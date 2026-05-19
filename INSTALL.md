# Installation Guide

This package installs the `evolver-codex-hybrid` skill into another workspace.

## Quick install

From the package root, run:

```bash
bash install.sh /path/to/target-workspace
```

## What gets installed

The installer writes:

```text
<target-workspace>/
├── .agents/
│   └── skills/
│       └── evolver-codex-hybrid/
│           └── SKILL.md
├── scripts/
│   ├── evolver_codex_bridge.js
│   ├── index_codex_sessions.js
│   └── record_execution_feedback.js
└── evolver-hybrid/
    ├── artifacts/
    ├── inbox/
    ├── memory/
    └── raw/
```

## Verify installation

After installation, the target workspace should contain:

1. `.agents/skills/evolver-codex-hybrid/SKILL.md`
2. `scripts/evolver_codex_bridge.js`
3. `evolver-hybrid/memory/stable-rules.md`

Then test from the target workspace:

```bash
node scripts/evolver_codex_bridge.js --run-maintenance all --format markdown
```

If the install is correct, the command should refresh local maintenance artifacts under `evolver-hybrid/artifacts/`.

## Suggested first use in Codex

Ask Codex something like:

```text
请检查这个工作区里的 evolver-hybrid 桥接配置，并说明下一步应该先读哪些本地产物。
```

If the skill is active, Codex should route into `evolver-codex-hybrid` and prioritize local bridge artifacts instead of giving a generic retrospective answer.

## Publish tip

If you put this package on GitHub, keep the repository root at this folder level so another Codex can clone it and immediately run:

```bash
bash install.sh /path/to/target-workspace
```
