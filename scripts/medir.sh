#!/usr/bin/env bash
# medir.sh <archivo.html>
# Mide en Chrome si algun bloque se desborda de su pagina. Devuelve JSON.
# Truco sin dependencias: la maqueta se automide y escribe el resultado en el
# DOM; lo sacamos con --dump-dom. No hace falta puppeteer ni playwright.
# OJO: --dump-dom se cuelga con el headless nuevo. Requiere --headless=old.
set -euo pipefail
source "$(dirname "$0")/_chrome.sh"
CH=$(find_chrome) || { echo "No encuentro Chrome. Corre scripts/doctor.sh" >&2; exit 1; }
IN="$1"; TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
DIR=$(cd "$(dirname "$IN")" && pwd)
OUT=$( (timeout 60 "$CH" --headless=old --disable-gpu --no-sandbox \
        --user-data-dir="$TMP" --virtual-time-budget=10000 --dump-dom \
        "file://$DIR/$(basename "$IN")" 2>/dev/null || true) \
     | sed -n 's/.*<script id="medicion" type="application\/json">\(.*\)<\/script>.*/\1/p' )
[ -n "$OUT" ] || { echo '{"error":"la maqueta no se pudo medir: falta incluir templates/medicion.js"}'; exit 1; }
echo "$OUT"
