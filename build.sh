#!/usr/bin/env bash
#
# Build the CV PDF from LaTeX.
# Usage:
#   ./build.sh            # build CV-HO-VAN-PHUOC.tex -> CV-HO-VAN-PHUOC.pdf
#   ./build.sh myfile.tex # build a specific .tex file
#   ./build.sh --clean    # remove LaTeX aux files
#
set -euo pipefail
cd "$(dirname "$0")"

TEX="${1:-CV-HO-VAN-PHUOC.tex}"

clean_aux() {
  rm -f ./*.aux ./*.log ./*.out ./*.toc ./*.fls ./*.fdb_latexmk ./*.synctex.gz ./*.xdv
}

if [[ "${1:-}" == "--clean" ]]; then
  clean_aux
  echo "Cleaned LaTeX aux files."
  exit 0
fi

if [[ ! -f "$TEX" ]]; then
  echo "Error: '$TEX' not found." >&2
  exit 1
fi

# Prefer xelatex (better font/unicode support); fall back to pdflatex.
if command -v latexmk >/dev/null 2>&1; then
  if command -v xelatex >/dev/null 2>&1; then
    latexmk -xelatex -interaction=nonstopmode -halt-on-error "$TEX"
  else
    latexmk -pdf -interaction=nonstopmode -halt-on-error "$TEX"
  fi
elif command -v xelatex >/dev/null 2>&1; then
  xelatex -interaction=nonstopmode -halt-on-error "$TEX"
  xelatex -interaction=nonstopmode -halt-on-error "$TEX"
else
  pdflatex -interaction=nonstopmode -halt-on-error "$TEX"
  pdflatex -interaction=nonstopmode -halt-on-error "$TEX"
fi

clean_aux
PDF="${TEX%.tex}.pdf"
echo "Built: $PDF"
