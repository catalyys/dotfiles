#!/usr/bin/env bash
# set -euo pipefail

# get repo updates: prefer checkupdates (pacman-contrib), fallback to pacman -Qu
repo_updates=0
if command -v checkupdates >/dev/null 2>&1; then
	repo_updates=$(checkupdates 2>/dev/null | wc -l)
else
	repo_updates=$(pacman -Qu 2>/dev/null | wc -l || echo 0)
fi

# get AUR updates via yay or paru if available
aur_updates=0
if command -v yay >/dev/null 2>&1; then
	aur_updates=$(yay -Qua 2>/dev/null | wc -l || echo 0)
elif command -v paru >/dev/null 2>&1; then
	aur_updates=$(paru -Qua 2>/dev/null | wc -l || echo 0)
fi

total=$((repo_updates + aur_updates))

if [ "${total}" -eq 0 ]; then
	fulltext="Up to date"
else
	fulltext="Updates: ${total} (repo:${repo_updates} aur:${aur_updates})"
fi

# Emit JSON with text (number) and tooltip (full message). Use python to JSON-escape safely.
python3 - <<PY "$total" "$fulltext"
import json, sys
text = sys.argv[1]
tooltip = sys.argv[2]
print(json.dumps({"text": text, "tooltip": tooltip}))
PY


