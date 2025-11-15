#!/usr/bin/env bash

# Check: precies 2 arguments nodig
if [ $# -ne 2 ]; then
  echo "Usage: $0 <SOURCE_DIR> <DEST_DIR>"
  exit 1
fi

SOURCE="$1"
DEST="$2"
TODAY="$(date +%Y-%m-%d_%H-%M-%S)"

echo "[INFO] Source      : $SOURCE"
echo "[INFO] Destination : $DEST"
echo "[INFO] Timestamp   : $TODAY"
echo

# Maak de doelmap als hij nog niet bestaat
mkdir -p "$DEST"

# Maak een submap met datum/tijd
TARGET_DIR="${DEST}/backup_${TODAY}"
mkdir -p "$TARGET_DIR"

echo "[INFO] Kopieer nu bestanden..."
cp -r "$SOURCE"/* "$TARGET_DIR"/

echo "[OK] Backup klaar in: $TARGET_DIR"