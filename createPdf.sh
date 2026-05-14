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

# Trova tutti i file .md (esclusi README e cartelle nascoste)
find . -type f -name "*.md" ! -name "README.md" -not -path "*/.*" -print0 | while IFS= read -r -d '' file; do

  # trova nomi
  dir_path=$(dirname "$file")
  subject=$(basename "$dir_path")
  filename=$(basename "$file" .md)

  # Se il file è nella root, usa "Appunti Generali" come materia
  if [ "$subject" = "." ]; then
    subject="Appunti Generali"
  fi

  DIR_MATERIA="${OUTPUT_DIR}/${subject}"
  mkdir -p "${DIR_MATERIA}"

  pdf_name="${filename}.pdf"
  echo -e "${BLUE} Elaborando${NC} $pdf_name"

  # File meta per header
  echo "\\newcommand{\\headerTitolo}{$filename}" > meta.tex
  echo "\\newcommand{\\headerMateria}{$subject}" >> meta.tex

  # fix blocchi di codice
  echo "\\usepackage{fvextra}" >> meta.tex
  echo "\\fvset{breaklines=true, breakanywhere=true}" >> meta.tex

  # abilito TikZ
  echo "\\usepackage{tikz}" >> meta.tex
  echo "\\usetikzlibrary{positioning, shapes.geometric, arrows.meta}" >> meta.tex

  # Correzione errori (grazie gemini)
  sed -E 's/> ?\[![a-zA-Z0-9_-]+\]/> /g' "$file" | sed 's/[ \t]*$//' | awk '/^[ \t]*\$\$[ \t]*$/ { if (!m) { print ""; print $0; m=1 } else { print $0; print ""; m=0 } next } 1' | cat -s > temp.md

  # generazione pdf
  pandoc temp.md -f markdown+wikilinks_title_after_pipe+hard_line_breaks --pdf-engine=lualatex -V geometry:"margin=2.5cm, headheight=20pt, includehead" -V lang=it-IT -V monofont="DejaVu Sans Mono" --highlight-style=tango -H meta.tex -H header.tex -o "${DIR_MATERIA}/${pdf_name}"

  # pulisci pdf
  rm temp.md meta.tex

done

echo ""
echo -e "${BLUE}Zippando${NC}"
echo ""

cd "$OUTPUT_DIR"
for subject_dir in */; do 
  dir_name="${subject_dir%/}"

  if [ -d "$dir_name" ]; then
    zip -qr "${dir_name}.zip" "${dir_name}"
    echo -e "${CYAN}Zippato ${NC} ${dir_name}.zip"
  fi
done

cd ..

echo -e "${GREEN}Generazione completata ${NC}(almeno quella senza errori). File messi in ${YELLOW}/$OUTPUT_DIR${NC}."
