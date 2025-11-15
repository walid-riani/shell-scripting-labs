#!/usr/bin/env bash
set -x
#
# dir-create-001.sh - Maak (indien nodig) een directory aan op basis van input
# Usage: ./dir-create-001.sh <DIRECTORY_PATH>

# --- Argumenten checken ---
if [ $# -ne 1 ]; then
  echo "Usage: $0 <DIRECTORY_PATH>"
  exit 1
fi

TARGET_DIR="$1"

echo "[INFO] Directory die aangemaakt moet worden: $TARGET_DIR"

# --- Directory aanmaken ---
if [ -d "$TARGET_DIR" ]; then
  echo "[INFO] Directory bestaat al, niets te doen."
else
  mkdir -p "$TARGET_DIR"
  echo "[OK] Directory aangemaakt: $TARGET_DIR"
fi