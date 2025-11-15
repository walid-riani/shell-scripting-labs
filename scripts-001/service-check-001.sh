#!/usr/bin/env bash
#
# service-check-001.sh - Controleer of een systemd service actief is
# Usage: ./service-check-001.sh <SERVICE_NAME>

# --- Argumenten checken ---
if [ $# -ne 1 ]; then
  echo "Usage: $0 <SERVICE_NAME>"
  exit 1
fi

SERVICE="$1"

echo "[INFO] Controleren van service: $SERVICE"

if ! command -v systemctl >/dev/null 2>&1; then
  echo "[ERROR] systemctl niet gevonden. Dit script vereist systemd."
  exit 1
fi

if systemctl is-active --quiet "$SERVICE"; then
  echo "[OK] Service '$SERVICE' is actief."
  exit 0
else
  echo "[ERROR] Service '$SERVICE' is NIET actief."
  systemctl status "$SERVICE" --no-pager -l | head -n 10
  exit 1
fi
