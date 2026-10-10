#!/bin/bash
set -euo pipefail

OUTPUT_DIR="pdf"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# --- controlli preliminari --------------------------------------------------
for cmd in pandoc lualatex; do
  if ! command -v "$cmd" > /dev/null 2>&1; then
    echo -e "${RED}Errore: $cmd non risulta installato. Installalo e riprova.${NC}" >&2
    exit 1
  fi
done

if [ ! -f "header.tex" ]; then
  echo -e "${RED}Errore: header.tex non trovato. Esegui lo script dalla cartella degli appunti.${NC}" >&2
  exit 1
fi

# --- cartella temporanea: temp.md e meta.tex non finiscono piu' nel vault ---
TMP_BUILD=$(mktemp -d "${TMPDIR:-/tmp}/createPdf.XXXXXX")
cleanup() { rm -rf -- "$TMP_BUILD"; }
trap cleanup EXIT INT TERM HUP

# --- pre-processing markdown (Obsidian -> pandoc/LaTeX) ---------------------
preprocess() {
  sed -E 's/> ?\[![a-zA-Z0-9_-]+\]/> /g' "$1" \
    | sed 's/[ \t]*$//' \
    | awk '/^[ \t]*\$\$[ \t]*$/ { if (!m) { print ""; print $0; m=1 } else { print $0; print ""; m=0 } next } 1' \
    | cat -s
}

mkdir -p "$OUTPUT_DIR"

echo ""
echo -e "${CYAN}Inizio gen pdf${NC}"
echo ""

ok=0
fail=0
failed_names=()

# Il find esclude OUTPUT_DIR: senza questo, dal secondo run in poi si ricom-
# pilano le copie in pdf/<materia>_Markdown creando cartelle a ricorsione.
while IFS= read -r -d '' file; do

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

  pdf_path="${DIR_MATERIA_PDF}/${filename}.pdf"
  echo -e "${BLUE}Elaborando:${NC} $pdf_path"

  if ! preprocess "$file" > "${TMP_BUILD}/temp.md"; then
    echo -e "${RED}Errore preprocessing:${NC} $filename" >&2
    fail=$((fail + 1))
    failed_names+=("$filename")
    continue
  fi

  # un file vuoto produrrebbe un PDF da 0 byte con exit code 0
  if [ ! -s "${TMP_BUILD}/temp.md" ]; then
    echo -e "${YELLOW}Salto:${NC} $filename (file vuoto)"
    continue
  fi

  # file meta per header (dentro la tmpdir, non nella root del vault)
  {
    echo "\\newcommand{\\headerTitolo}{$filename}"
    echo "\\newcommand{\\headerMateria}{$subject}"
  } > "${TMP_BUILD}/meta.tex"

  # si parte sempre da PDF inesistente, cosi' un vecchio file non viene
  # scambiato per un successo se la compilazione fallisce
  rm -f -- "$pdf_path"

  if ! pandoc - -f markdown+wikilinks_title_after_pipe+hard_line_breaks --pdf-engine=lualatex \
      -V geometry:"margin=2.5cm, headheight=20pt, includehead" \
      -V lang=it-IT -V monofont="DejaVu Sans Mono" \
      --highlight-style=tango -H "${TMP_BUILD}/meta.tex" -H header.tex \
      -o "$pdf_path" < "${TMP_BUILD}/temp.md" 2> "${TMP_BUILD}/pandoc.log"; then
    echo -e "${RED}Errore compilazione:${NC} $filename" >&2
    tail -n 15 "${TMP_BUILD}/pandoc.log" | sed 's/^/  /' >&2
    rm -f -- "$pdf_path"
    fail=$((fail + 1))
    failed_names+=("$filename")
    continue
  fi

  if [ ! -s "$pdf_path" ]; then
    echo -e "${RED}PDF vuoto generato:${NC} $filename" >&2
    rm -f -- "$pdf_path"
    fail=$((fail + 1))
    failed_names+=("$filename")
    continue
  fi

  ok=$((ok + 1))
# README.md e GUIDA.md sono documentazione, non appunti: niente PDF per loro.
done < <(find . -type f -name "*.md" ! -name "README.md" ! -name "GUIDA.md" -not -path "*/.*" -not -path "./${OUTPUT_DIR}/*" -print0 | sort -z)

echo ""
echo -e "${GREEN}Generazione completata:${NC} ${ok} PDF ok, ${fail} falliti. File messi in ${YELLOW}/${OUTPUT_DIR}${NC}."

if [ "$fail" -gt 0 ]; then
  echo -e "${RED}File falliti:${NC} ${failed_names[*]}" >&2
  exit 1
fi
