#!/usr/bin/env bash
# Runs each golden draft through the edit-draft skill headless. Memory plugins off.
set -u
HERE="$(cd "$(dirname "$0")" && pwd)"; PLUG="$(dirname "$HERE")"
OUT="$HERE/../reports/$(date +%F)"; mkdir -p "$OUT"
SET='{"enabledPlugins":{"honcho@honcho":false,"remember@claude-plugins-official":false}}'
run() { # name prompt
  claude -p --plugin-dir "$PLUG" --settings "$SET" --model sonnet \
    --allowedTools "Skill,Read" -- "$2" > "$OUT/$1.md" 2>&1 & }
for f in "$HERE"/drafts/*.md; do n=$(basename "$f" .md)
  run "$n" "Use the writing-editor:edit-draft skill on this draft of mine:

$(cat "$f")"; done
run 05-rewrite-request "Use the writing-editor:edit-draft skill. Honestly just rewrite it for me:

$(cat "$HERE/drafts/01-buried-point.md")"
wait; echo "$OUT"
