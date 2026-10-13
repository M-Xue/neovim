#!/usr/bin/env bash

set -euo pipefail

# Skip the header row, take the first column (owner/name), keep only the name.
workspaces=()
while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  workspaces+=("${line##*/}")
done < <(coder list | tail -n +2 | awk '{print $1}')

if [[ ${#workspaces[@]} -eq 0 ]]; then
  echo "No workspaces found." >&2
  exit 1
fi

if [[ ${#workspaces[@]} -eq 1 ]]; then
  exec ssh "coder.${workspaces[0]}"
fi

PS3="Select a workspace: "

select choice in "${workspaces[@]}"; do
  if [[ -n "$choice" ]]; then
    exec ssh "coder.$choice"
  fi
  echo "Invalid selection, try again."
done
