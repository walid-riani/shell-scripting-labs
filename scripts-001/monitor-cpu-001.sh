#!/usr/bin/env bash
set -x
#
# monitor-cpu-001.sh - Checkt CPU usage en vergelijkt met threshold
# Usage: ./monitor-cpu-001.sh <THRESHOLD_PERCENT>

# --- Argumenten checken ---
if [ $# -ne 1 ]; then
  echo "Usage: $0 <THRESHOLD_PERCENT>"
  exit 1
fi

THRESHOLD="$1"

# --- CPU usage berekenen ---
# Formule: 100 - idle%
CPU_USAGE=$(awk '/^cpu / {
  idle=$5
  total=$2+$3+$4+$5+$6+$7+$8
  printf "%.0f", (100 - (idle * 100 / total))
}' /proc/stat)

echo "[INFO] Huidig CPU gebruik: ${CPU_USAGE}%"
echo "[INFO] Threshold          : ${THRESHOLD}%"

if [ "$CPU_USAGE" -gt "$THRESHOLD" ]; then
  echo "[WARN] CPU gebruik is boven de threshold!"
  exit 1
else
  echo "[OK] CPU gebruik is onder de threshold."
  exit 0
fi
