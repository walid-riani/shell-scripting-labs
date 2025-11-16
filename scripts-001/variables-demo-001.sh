#!/usr/bin/env bash

# Variabele aanmaken (toekennen)
name="Walid"
city="Rotterdam"
age=28

# Variabele gebruiken (uitlezen)
echo "Naam: $name"
echo "Woonplaats: $city"
echo "Leeftijd: $age"

# Variabele aanpassen
age=$((age + 1))
echo "Volgend jaar ben je: $age"

# Variabele gemaakt op basis van output (command substitution) -> date is een ingebouwd Linux-command
today=$(date +%Y-%m-%d)
echo "Vandaag is: $today"
