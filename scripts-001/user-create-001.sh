#!/usr/bin/env bash
#
# user-create-001.sh - Maak een nieuwe Linux gebruiker aan
# Usage: sudo ./user-create-001.sh <USERNAME>

# --- Argumenten checken ---
if [ $# -ne 1 ]; then
  echo "Usage: $0 <USERNAME>"
  exit 1
fi

# --- Root-check ---
if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] Dit script moet als root of via sudo gedraaid worden."
  exit 1
fi

USERNAME="$1"

echo "[INFO] Nieuwe gebruiker: $USERNAME"

# --- Check of user al bestaat ---
if id "$USERNAME" >/dev/null 2>&1; then
  echo "[WARN] Gebruiker '$USERNAME' bestaat al. Stop."
  exit 0
fi

# --- User aanmaken ---
useradd -m -s /bin/bash "$USERNAME"

if [ $? -eq 0 ]; then
  echo "[OK] Gebruiker '$USERNAME' succesvol aangemaakt."
  echo "[INFO] Stel eventueel een wachtwoord in met: sudo passwd $USERNAME"
else
  echo "[ERROR] Aanmaken gebruiker '$USERNAME' is mislukt."
  exit 1
fi
