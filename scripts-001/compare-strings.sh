#!/usr/bin/env bash
#
# compare-strings.sh - Compare two strings and report if they match.
#
# Usage:
#   ./compare-strings.sh <string1> <string2>
#
# Example:
#   ./compare-strings.sh hello hello     # equal
#   ./compare-strings.sh devops cloud   # different

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Error: Not enough arguments."
  echo "Usage: $0 <string1> <string2>"
  exit 1
fi

str1="$1"
str2="$2"

if [ "$str1" = "$str2" ]; then
  echo "Strings are equal"
else
  echo "Strings are different"
fi
