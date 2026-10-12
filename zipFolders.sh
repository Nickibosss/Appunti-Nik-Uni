#!/bin/bash
set -euo pipefail
shopt -s nullglob

OUTPUT_DIR="pdf"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

if ! command -v zip > /dev/null 2>&1; then
  echo -e "${RED}Errore: zip non risulta installato. Installalo e riprova.${NC}" >&2
  exit 1
fi

# prima si controlla, poi si crea: nell'old versione la mkdir -p rendeva
# questo controllo inutile (scattava mai)
if [ ! -d "$OUTPUT_DIR" ]; then
    echo -e "${YELLOW}Errore: La cartella /$OUTPUT_DIR non esiste. Esegui prima createPdf.sh${NC}" >&2
    exit 1
fi

echo -e "${YELLOW}Zippando files...${NC}"

(
  cd "$OUTPUT_DIR"

  # rimuovo altri zip
  rm -f -- *.zip

  count=0
  for subject_dir in */; do
    dir_name="${subject_dir%/}"
    zip -qr "${dir_name}.zip" "${dir_name}"
    echo "Zippato: ${dir_name}.zip"
    count=$((count + 1))
  done

  if [ "$count" -eq 0 ]; then
    echo -e "${YELLOW}Errore: nessuna cartella da zippare in /$OUTPUT_DIR. Esegui prima createPdf.sh${NC}" >&2
    exit 1
  fi
)

echo -e "${GREEN}Zipping completato ${NC}(almeno quello senza errori). File zip in ${YELLOW}/${OUTPUT_DIR}${NC}."
