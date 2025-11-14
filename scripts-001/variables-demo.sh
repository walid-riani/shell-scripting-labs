#!/usr/bin/env bash
#
# variables-demo.sh - Demo script voor KodeKloud "Variables" sectie

APP_NAME="variables-demo"

# Variabelen met systeeminfo
USER_NAME="${USER:-unknown}"                # environment variable (met fallback)
HOST_NAME="$(hostname)"                     # command substitution
TIMESTAMP="$(date '+%Y-%m-%d_%H-%M-%S')"    # datum/tijd als string

# Variabelen voor backup
BACKUP_SOURCE="$HOME/.bash_history"         # simpel voorbeeldbestand
BACKUP_DIR="$HOME/variables-demo-bkp"
BACKUP_FILE="${BACKUP_DIR}/bash_history_${TIMESTAMP}.bkp"

echo "[$APP_NAME] Running as user : $USER_NAME"
echo "[$APP_NAME] Hostname        : $HOST_NAME"
echo "[$APP_NAME] Timestamp       : $TIMESTAMP"
echo "[$APP_NAME] Backup source   : $BACKUP_SOURCE"
echo "[$APP_NAME] Backup dir      : $BACKUP_DIR"
echo "[$APP_NAME] Backup file     : $BACKUP_FILE"
echo

# Check of het source-bestand bestaat
if [[ ! -f "$BACKUP_SOURCE" ]]; then
  echo "[$APP_NAME] ERROR: source file '$BACKUP_SOURCE' not found." >&2
  exit 1
fi

# Maak backup-directory als die nog niet bestaat
mkdir -p "$BACKUP_DIR"

# Maak de backup
if cp -- "$BACKUP_SOURCE" "$BACKUP_FILE"; then
  echo "[$APP_NAME] Backup created ✅"
else
  echo "[$APP_NAME] ERROR: failed to create backup." >&2
  exit 1
fi
