#!/bin/bash

OUTPUT_DIR="pdf"
mkdir -p "$OUTPUT_DIR"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${CYAN}Inizio gen pdf${NC}"
echo ""

# trovo tutti i file markdown tranne readme
find . -type f -name "*.md" ! -name "README.md" -not -path "*/.*" -print0 | while IFS= read -r -d '' file; do

  dir_path=$(dirname "$file")
  subject=$(basename "$dir_path")
  filename=$(basename "$file" .md)

  if [ "$subject" = "." ]; then
    subject="Appunti Generali"
  fi

  DIR_MATERIA_PDF="${OUTPUT_DIR}/${subject}_PDF"
  DIR_MATERIA_MD="${OUTPUT_DIR}/${subject}_Markdown"
  
  mkdir -p "${DIR_MATERIA_PDF}" "${DIR_MATERIA_MD}"

  # Copia sorgente
  cp "$file" "${DIR_MATERIA_MD}/"

  pdf_name="${filename}.pdf"
  echo -e "${BLUE}Elaborando:${NC} $pdf_name"

  # file meta per header
  echo "\\newcommand{\\headerTitolo}{$filename}" > meta.tex
  echo "\\newcommand{\\headerMateria}{$subject}" >> meta.tex

  # Pre-processing 
  sed -E 's/> ?\[![a-zA-Z0-9_-]+\]/> /g' "$file" | sed 's/[ \t]*$//' | awk '/^[ \t]*\$\$[ \t]*$/ { if (!m) { print ""; print $0; m=1 } else { print $0; print ""; m=0 } next } 1' | cat -s > temp.md

  pandoc temp.md -f markdown+wikilinks_title_after_pipe+hard_line_breaks --pdf-engine=lualatex \
    -V geometry:"margin=2.5cm, headheight=20pt, includehead" \
    -V lang=it-IT -V monofont="DejaVu Sans Mono" \
    --highlight-style=tango -H meta.tex -H header.tex \
    -o "${DIR_MATERIA_PDF}/${pdf_name}"

done

rm -f temp.md meta.tex

echo -e "${GREEN}Generazione completata ${NC}(almeno quella senza errori). File messi in ${YELLOW}/$OUTPUT_DIR${NC}."
