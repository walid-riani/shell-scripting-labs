#!/usr/bin/env bash

# ================================
#  Distro Inspector (Pro Version)
#  Author: Walid Riani
#  Description: Shows package manager info for major Linux distros.
# ================================

# ----- Kleuren -----
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

# ----- Header functie -----
print_header() {
    echo -e "${CYAN}=====================================${RESET}"
    echo -e "${GREEN}        Distro Package Inspector     ${RESET}"
    echo -e "${CYAN}=====================================${RESET}"
}

# ----- Validatie -----
if [ $# -ne 1 ]; then
    echo -e "${RED}Fout:${RESET} Je moet 1 argument geven."
    echo -e "Gebruik: ${YELLOW}$0 <DistroNaam>${RESET}"
    exit 1
fi

# Arg naar lowercase voor consistentie
distro=$(echo "$1" | tr 'A-Z' 'a-z')

print_header

case "$distro" in

    fedora|rhel|centos)
        echo -e "${BLUE}Distro      :${RESET} $1"
        echo -e "${BLUE}Type        :${RESET} RPM-based"
        echo -e "${BLUE}Managers    :${RESET} yum, dnf"
        echo ""
        echo -e "${YELLOW}Voorbeelden:${RESET}"
        echo -e "  - Lijst packages : ${CYAN}dnf list installed${RESET}"
        echo -e "  - Installeren    : ${CYAN}sudo dnf install <pakket>${RESET}"
        echo -e "  - Updaten        : ${CYAN}sudo dnf update${RESET}"
        ;;

    debian|ubuntu|linuxmint|popos)
        echo -e "${BLUE}Distro      :${RESET} $1"
        echo -e "${BLUE}Type        :${RESET} DEB-based"
        echo -e "${BLUE}Managers    :${RESET} apt, dpkg"
        echo ""
        echo -e "${YELLOW}Voorbeelden:${RESET}"
        echo -e "  - Lijst packages : ${CYAN}apt list --installed${RESET}"
        echo -e "  - Installeren    : ${CYAN}sudo apt install <pakket>${RESET}"
        echo -e "  - Updaten        : ${CYAN}sudo apt update && sudo apt upgrade${RESET}"
        ;;

    arch|manjaro)
        echo -e "${BLUE}Distro      :${RESET} $1"
        echo -e "${BLUE}Type        :${RESET} Arch-based"
        echo -e "${BLUE}Managers    :${RESET} pacman"
        echo ""
        echo -e "${YELLOW}Voorbeelden:${RESET}"
        echo -e "  - Lijst packages : ${CYAN}pacman -Q${RESET}"
        echo -e "  - Installeren    : ${CYAN}sudo pacman -S <pakket>${RESET}"
        echo -e "  - Updaten        : ${CYAN}sudo pacman -Syu${RESET}"
        ;;

    *)
        echo -e "${RED}Onbekende distro:${RESET} $1"
        echo -e "Ondersteunde distros: ${YELLOW}Ubuntu, Debian, Fedora, RHEL, CentOS, Arch, Manjaro${RESET}"
        exit 1
        ;;
esac
