#!/usr/bin/env bash
#
# menu-calculator.sh - Eenvoudige menu-gestuurde rekenmachine voor de terminal
# Gebruik:
#   ./menu-calculator.sh

# Kleuren
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

# Helper: check of invoer een geheel getal is
is_integer() {
    [[ "$1" =~ ^-?[0-9]+$ ]]
}

# Helper: vraag twee getallen op een nette manier
read_two_numbers() {
    while true; do
        read -p "Voer getal 1 in: " n1
        read -p "Voer getal 2 in: " n2

        if ! is_integer "$n1" || ! is_integer "$n2"; then
            echo -e "${RED}Fout:${RESET} beide waarden moeten gehele getallen zijn."
            echo
            continue
        fi

        NUMBER1="$n1"
        NUMBER2="$n2"
        break
    done
}

while true; do
    echo
    echo -e "${CYAN}=== Menu calculator ===${RESET}"
    echo "1) Optellen"
    echo "2) Aftrekken"
    echo "3) Vermenigvuldigen"
    echo "4) Delen"
    echo "5) Stoppen"
    echo

    read -p "Maak een keuze (1-5): " choice
    echo

    case "$choice" in
        1)
            echo "Optellen gekozen."
            read_two_numbers
            answer=$(( NUMBER1 + NUMBER2 ))
            echo -e "${GREEN}Antwoord = $answer${RESET}"
            ;;

        2)
            echo "Aftrekken gekozen."
            read_two_numbers
            answer=$(( NUMBER1 - NUMBER2 ))
            echo -e "${GREEN}Antwoord = $answer${RESET}"
            ;;

        3)
            echo "Vermenigvuldigen gekozen."
            read_two_numbers
            answer=$(( NUMBER1 * NUMBER2 ))
            echo -e "${GREEN}Antwoord = $answer${RESET}"
            ;;

        4)
            echo "Delen gekozen."
            read_two_numbers

            if [ "$NUMBER2" -eq 0 ]; then
                echo -e "${RED}Fout:${RESET} delen door nul is niet toegestaan."
            else
                # integer deling
                answer=$(( NUMBER1 / NUMBER2 ))
                rest=$(( NUMBER1 % NUMBER2 ))
                echo -e "${GREEN}Antwoord = $answer${RESET}"
                echo "Rest      = $rest"
            fi
            ;;

        5)
            echo "Programma wordt afgesloten."
            break
            ;;

        *)
            echo -e "${YELLOW}Ongeldige keuze. Kies 1 t/m 5.${RESET}"
            ;;
    esac
done
