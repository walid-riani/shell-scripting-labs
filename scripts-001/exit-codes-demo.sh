#!/usr/bin/env bash
#
# exit-codes-demo.sh - Demo script over exit codes
#
# Gebruik:
#   ./exit-codes-demo.sh /pad/naar/logfile

set -o errexit
set -o nounset
set -o pipefail

APP_NAME="exit-codes-demo"

# Exit codes
EXIT_OK=0
EXIT_MISSING_ARG=10
EXIT_FILE_NOT_FOUND=11
EXIT_ERRORS_FOUND=20

log() {
  # Simpele logfunctie
  printf '[%s] %s\n' "$APP_NAME" "$*"
}

usage() {
  cat <<EOF
Gebruik: $0 /pad/naar/logfile

Checks:
  1) Bestaat het logfile?
  2) Bevat het het woord "ERROR"?

Exit codes:
  $EXIT_OK           = succes, geen fouten gevonden
  $EXIT_MISSING_ARG  = geen logfile-pad opgegeven
  $EXIT_FILE_NOT_FOUND = bestand bestaat niet
  $EXIT_ERRORS_FOUND = er zijn fouten ("ERROR") gevonden
EOF
}

# 1) Check: is er precies 1 argument?
if [ "$#" -ne 1 ]; then
  log "Fout: je moet één logfile-pad meegeven."
  usage
  exit "$EXIT_MISSING_ARG"
fi

LOGFILE=$1

# 2) Bestaat het bestand?
if [ ! -f "$LOGFILE" ]; then
  log "Fout: bestand '$LOGFILE' bestaat niet."
  exit "$EXIT_FILE_NOT_FOUND"
fi

log "Controleer logfile: $LOGFILE"

# 3) Zoeken naar "ERROR" in het logfile
if grep -q "ERROR" "$LOGFILE"; then
  log "Er zijn fouten gevonden in het logfile."
  exit "$EXIT_ERRORS_FOUND"
else
  log "Geen fouten gevonden. Alles OK."
  exit "$EXIT_OK"
fi
