#!/usr/bin/env bash
#
# check-file.sh - Check whether a path is an existing regular file.
#
# Usage:
#   ./check-file.sh <path-to-file>
#
# Example:
#   ./check-file.sh /etc/hosts

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Error: No file path given."
  echo "Usage: $0 <path-to-file>"
  exit 1
fi

file_path="$1"

if [ -f "$file_path" ]; then
  echo "File exists: $file_path"
else
  echo "File not found: $file_path"
  exit 2
fi
