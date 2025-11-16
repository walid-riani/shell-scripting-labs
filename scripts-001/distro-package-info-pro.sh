#!/usr/bin/env bash
#
# distro-package-info-pro.sh - Toon pakketbeheer-info per Linux distributie
#
# Usage:
#   ./distro-package-info-pro.sh <distro>
#   ./distro-package-info-pro.sh ubuntu
#   ./distro-package-info-pro.sh fedora
#

set -euo pipefail

SCRIPT_NAME="$(basename "$0")"

# Kleuren
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

usage() {
  cat <<EOF
${BOLD}Usage:${RESET}
  $SCRIPT_NAME <distro>

${BOLD}Voorbeelden:${RESET}
  $SCRIPT_NAME ubuntu
  $SCRIPT_NAME debian
  $SCRIPT_NAME fedora
  $SCRIPT_NAME arch

${BOLD}Ondersteunde distributies:${RESET}
  debian, ubuntu
  fedora, centos, rhel, rocky, alma
  arch
EOF
}

# 1) Validatie van arguments
if [[ $# -ne 1 ]]; then
  echo -e "${RED}Error:${RESET} geen distributienaam opgegeven.\n" >&2
  usage
  exit 1
fi

case "$1" in
  -h|--help)
    usage
    exit 0
    ;;
esac

# 2) Normaliseer input naar lowercase (ubuntu, Ubuntu, UBUNTU → ubuntu)
input="$1"
distro="$(echo "$input" | tr '[:upper:]' '[:lower:]')"

distro_name=""
distro_type=""
managers=""
examples=""

# 3) Case statement voor distro-info
case "$distro" in
  debian|ubuntu)
    distro_name="$(tr '[:lower:]' '[:upper:]' <<< "${distro:0:1}")${distro:1}"   # hoofdletter aan het begin
    distro_type="DEB-based"
    managers="apt, dpkg"
    examples=$'  - Lijst packages : sudo apt list --installed\n  - Installeren     : sudo apt install <pakket>\n  - Updaten         : sudo apt update && sudo apt upgrade'
    ;;
  fedora|centos|rhel|rocky|alma)
    # Klein beetje nette naam maken
    case "$distro" in
      fedora) distro_name="Fedora" ;;
      centos) distro_name="CentOS" ;;
      rhel)   distro_name="RHEL" ;;
      rocky)  distro_name="Rocky Linux" ;;
      alma)   distro_name="AlmaLinux" ;;
    esac
    distro_type="RPM-based"
    managers="dnf/yum, rpm"
    examples=$'  - Lijst packages : sudo dnf list installed\n  - Installeren     : sudo dnf install <pakket>\n  - Updaten         : sudo dnf upgrade --refresh'
    ;;
  arch)
    distro_name="Arch Linux"
    distro_type="Pacman-based"
    managers="pacman"
    examples=$'  - Lijst packages : sudo pacman -Q\n  - Installeren     : sudo pacman -S <pakket>\n  - Updaten         : sudo pacman -Syu'
    ;;
  *)
    echo -e "${RED}Error:${RESET} onbekende distributie: ${YELLOW}$input${RESET}\n" >&2
    usage
    exit 2
    ;;
esac

# 4) Nette, gekleurde output
echo
echo -e "${BOLD}${BLUE}Distro package info${RESET}"
echo    "--------------------"
printf "%-10s: %s\n" "Distro"   "$distro_name"
printf "%-10s: %s\n" "Type"     "$distro_type"
printf "%-10s: %s\n" "Managers" "$managers"
echo
echo -e "${BOLD}Voorbeelden:${RESET}"
echo -e "$examples"
echo
