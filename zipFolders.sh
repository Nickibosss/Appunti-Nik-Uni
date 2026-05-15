#!/bin/bash

OUTPUT_DIR="pdf"
mkdir -p "$OUTPUT_DIR"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

if [ ! -d "$OUTPUT_DIR" ]; then
    echo -e "${YELLOW}Errore: La cartella /$OUTPUT_DIR non esiste. Esegui prima createPdf.sh${NC}"
    exit 1
fi

echo -e "${YELLOW}Zippando files...${NC}"

cd "$OUTPUT_DIR"
# rimuovo altri zip
rm -f *.zip

for subject_dir in */; do 
  dir_name="${subject_dir%/}"
  if [ -d "$dir_name" ]; then
    zip -qr "${dir_name}.zip" "${dir_name}"
    echo -e "Zippato: ${dir_name}.zip"
  fi
done

cd ..

echo -e "${GREEN}Zipping completato ${NC}(almeno quello senza errori). File zip in ${YELLOW}/$OUTPUT_DIR${NC}."

