#!/usr/bin/env bash
#
# os-info.sh - Determine if a Linux distribution uses RPM or DEB
# Author: Walid Riani
# Description: Demonstration of case statements in Bash

# --- Input ---
# Vraag gebruiker om een OS-naam in te voeren
read -p "Enter Linux distribution (Fedora / RHEL / CentOS / Debian / Ubuntu): " os

# --- Logic ---
# Vergelijk de waarde van $os met verschillende opties
case "$os" in

    "Fedora" | "RHEL" | "CentOS")
        echo "Uses RPM package manager"
        ;;

    "Debian" | "Ubuntu")
        echo "Uses DEB package manager"
        ;;

    *)
        echo "Unknown distribution"
        ;;
esac
