#!/usr/bin/env bash
#
# distro-package-info.sh - Toon package manager info voor bekende Linux-distributies
#
# Voorbeelden:
#   ./distro-package-info.sh Ubuntu
#   ./distro-package-info.sh fedora
#   ./distro-package-info.sh        # start interactief menu

set -euo pipefail

# Kleine helper: usage tonen
show_usage() {
  cat <<EOF
Gebruik: $(basename "$0") [DISTRO]

Bekende distributies:
  - Fedora, RHEL, CentOS
  - Debian, Ubuntu

Zonder argument start een interactief menu.
EOF
}

# Kernfunctie: info printen over een distro
print_distro_info() {
  local os="$1"

  # Normaliseer een beetje: maak eerste letter hoofdletter
  # zodat 'ubuntu', 'Ubuntu' en 'UBUNTU' allemaal werken.
  os="$(tr '[:upper:]' '[:lower:]' <<< "$os")"

  case "$os" in
    fedora|rhel|centos)
      echo "Distro     : ${os^}"
      echo "Type       : RPM-based"
      echo "Managers   : dnf, yum, rpm"
      echo "Voorbeelden:
  - Lijst packages : dnf list installed
  - Installeren    : sudo dnf install <pakket>
  - Updaten        : sudo dnf update
"
      ;;
    debian|ubuntu)
      echo "Distro     : ${os^}"
      echo "Type       : DEB-based"
      echo "Managers   : apt, dpkg"
      echo "Voorbeelden:
  - Lijst packages : apt list --installed
  - Installeren    : sudo apt install <pakket>
  - Updaten        : sudo apt update && sudo apt upgrade
"
      ;;
    *)
      echo "Onbekende distro: $os"
      echo "Ondersteund: Fedora, RHEL, CentOS, Debian, Ubuntu"
      return 1
      ;;
  esac
}

# === Hoofdlogica ===

# Als er een argument is → direct info tonen en stoppen
if [[ $# -ge 1 ]]; then
  print_distro_info "$1" || exit 1
  exit 0
fi

# Geen argument → interactief menu met while + case
while true; do
  echo "=============================="
  echo " Distro Package Info - Menu"
  echo "=============================="
  echo "1) Fedora"
  echo "2) RHEL"
  echo "3) CentOS"
  echo "4) Debian"
  echo "5) Ubuntu"
  echo "6) Andere naam invoeren"
  echo "7) Usage tonen"
  echo "8) Quit"
  echo

  read -rp "Maak een keuze [1-8]: " choice
  echo

  case "$choice" in
    1) print_distro_info "Fedora" ;;
    2) print_distro_info "RHEL" ;;
    3) print_distro_info "CentOS" ;;
    4) print_distro_info "Debian" ;;
    5) print_distro_info "Ubuntu" ;;
    6)
       read -rp "Voer een distributienaam in: " custom_os
       echo
       print_distro_info "$custom_os" || true
       ;;
    7) show_usage ;;
    8)
       echo "Bye 👋"
       exit 0
       ;;
    *)
       echo "Ongeldige keuze, probeer opnieuw."
       ;;
  esac

  echo
done
