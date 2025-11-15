#!/usr/bin/env bash
#
# logs-cleanup-001.sh - Verwijder .log files ouder dan X dagen
# Usage: ./logs-cleanup-001.sh <LOG_DIR> <DAGEN_OUDER_DAN>

# --- Argumenten checken ---
if [ $# -ne 2 ]; then
  echo "Usage: $0 <LOG_DIR> <DAGEN_OUDER_DAN>"
  exit 1
fi

LOG_DIR="$1"
DAYS="$2"

echo "[INFO] Log directory : $LOG_DIR"
echo "[INFO] Ouder dan     : $DAYS dagen"

# --- Bestaan van directory checken ---
if [ ! -d "$LOG_DIR" ]; then
  echo "[ERROR] Directory '$LOG_DIR' bestaat niet."
  exit 1
fi

echo "[INFO] Te verwijderen bestanden:"
find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS" -print

echo
echo "[INFO] Verwijderen..."
find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS" -delete

echo "[OK] Opschonen afgerond."
