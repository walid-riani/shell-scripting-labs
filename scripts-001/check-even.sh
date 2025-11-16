#!/usr/bin/env bash
#
# check-even.sh - Determine if a number is even or odd.
#
# Usage:
#   ./check-even.sh <number>
#
# Examples:
#   ./check-even.sh 10   # even
#   ./check-even.sh 7    # odd

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Error: No number given."
  echo "Usage: $0 <integer>"
  exit 1
fi

number="$1"

# Validate integer input (optional but good practice)
if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
  echo "Error: '$number' is not a valid integer."
  exit 2
fi

if (( number % 2 == 0 )); then
  echo "$number is even"
else
  echo "$number is odd"
fi
