#!/usr/bin/env bash
set -euo pipefail

if [ "${1:-}" = "" ]; then
  echo "Usage: bash install.sh /path/to/target-workspace" >&2
  exit 1
fi

PACKAGE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$(cd "$1" && pwd)"

SKILL_TARGET="$TARGET_DIR/.agents/skills/evolver-codex-hybrid"
SCRIPTS_TARGET="$TARGET_DIR/scripts"
BASE_DIR="$TARGET_DIR/evolver-hybrid"

mkdir -p \
  "$SKILL_TARGET" \
  "$SCRIPTS_TARGET" \
  "$BASE_DIR/artifacts/gene-candidates" \
  "$BASE_DIR/artifacts/promotion-packets" \
  "$BASE_DIR/inbox" \
  "$BASE_DIR/memory/agent-genes" \
  "$BASE_DIR/raw"

cp "$PACKAGE_DIR/skills/evolver-codex-hybrid/SKILL.md" "$SKILL_TARGET/SKILL.md"
cp "$PACKAGE_DIR/scripts/evolver_codex_bridge.js" "$SCRIPTS_TARGET/evolver_codex_bridge.js"
cp "$PACKAGE_DIR/scripts/index_codex_sessions.js" "$SCRIPTS_TARGET/index_codex_sessions.js"
cp "$PACKAGE_DIR/scripts/record_execution_feedback.js" "$SCRIPTS_TARGET/record_execution_feedback.js"

cat > "$BASE_DIR/memory/stable-rules.md" <<'EOF'
# Stable Rules

Promote only lessons that survived at least one real task.

## Rules
EOF

cat > "$BASE_DIR/artifacts/next-prompt.md" <<'EOF'
# Next Prompt

No active distilled prompt yet.

Run the bridge or maintenance workflow first.
EOF

cat > "$BASE_DIR/artifacts/next-actions.json" <<'EOF'
[]
EOF

cat > "$BASE_DIR/artifacts/delegate-suggestions.json" <<'EOF'
[]
EOF

cat > "$BASE_DIR/artifacts/feedback-insights.md" <<'EOF'
# Feedback Insights

No feedback insights generated yet.
EOF

cat > "$BASE_DIR/artifacts/debrief-reminder.md" <<'EOF'
# Debrief Reminder

No debrief reminder generated yet.
EOF

cat > "$BASE_DIR/inbox/next-task.md" <<'EOF'
# Next Task

Review `../memory/stable-rules.md` first, then refresh bridge artifacts as needed.
EOF

cat > "$BASE_DIR/raw/latest-evolver-output.txt" <<'EOF'
# Paste or write fresh Evolver-style output here before ingesting.
EOF

: > "$BASE_DIR/memory/execution-feedback.ndjson"
: > "$BASE_DIR/memory/evolution-events.ndjson"
: > "$BASE_DIR/memory/task-session-index.ndjson"
: > "$BASE_DIR/memory/codex-session-index.ndjson"

echo "Installed evolver-codex-hybrid into: $TARGET_DIR"
echo "Skill: $SKILL_TARGET/SKILL.md"
echo "Bridge script: $SCRIPTS_TARGET/evolver_codex_bridge.js"
echo "Base dir: $BASE_DIR"
