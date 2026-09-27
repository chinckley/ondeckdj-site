#!/bin/bash
# Claude Code cloud-session setup. Runs from the SessionStart hook in
# .claude/settings.json. Locally it exits at once: CLAUDE_CODE_REMOTE is only
# "true" inside a Claude Code cloud session (claude.ai/code, `claude --cloud`,
# Desktop "Cloud"). Whatever this prints is added to Claude's context.
[ "$CLAUDE_CODE_REMOTE" = "true" ] || exit 0
ROOT="${CLAUDE_PROJECT_DIR:-$(pwd)}"

# Quoted heredoc: the notice is printed verbatim and can never run anything.
cat <<'CLOUD_NOTE_EOF'
[Cloud session] ondeckdj-site is running in a Claude Code cloud VM (Ubuntu Linux).
- Static site: edit HTML/CSS/JS directly; preview with `python3 -m http.server` if needed. Deployment happens outside this VM.
CLOUD_NOTE_EOF
[ -n "$IMPORT_NOTE" ] && echo "- $IMPORT_NOTE"
exit 0
