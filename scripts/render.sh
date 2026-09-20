#!/usr/bin/env bash
# render.sh <entrada.html> <salida.pdf> [segundos]
#
# Chrome NO recomprime las imagenes: el JPEG original viaja byte a byte al PDF
# nuevo (verificado con MD5). Esa es la razon de usar Chrome y no otro motor.
#
# OJO: Chrome escribe el PDF y despues NO termina el proceso. Esperar su exit
# code cuesta el timeout completo. Por eso lo lanzamos en segundo plano,
# sondeamos hasta que el archivo deja de crecer, y lo matamos.
set -uo pipefail
source "$(dirname "$0")/_chrome.sh"
CH=$(find_chrome) || { echo "No encuentro Chrome. Corre scripts/doctor.sh" >&2; exit 1; }

IN="$1"; OUT="$2"; MAX="${3:-90}"
DIR=$(cd "$(dirname "$IN")" && pwd)
OUT_ABS="$(cd "$(dirname "$OUT")" && pwd)/$(basename "$OUT")"
TMP=$(mktemp -d)
rm -f "$OUT_ABS"

tam() { [ -f "$1" ] && (stat -f%z "$1" 2>/dev/null || stat -c%s "$1" 2>/dev/null) || echo 0; }

"$CH" --headless --disable-gpu --no-pdf-header-footer --no-sandbox \
  --user-data-dir="$TMP" --print-to-pdf="$OUT_ABS" --virtual-time-budget=20000 \
  "file://$DIR/$(basename "$IN")" >/dev/null 2>&1 &
PID=$!
limpiar() { kill "$PID" 2>/dev/null; wait "$PID" 2>/dev/null; rm -rf "$TMP"; }
trap limpiar EXIT

prev=-1; estable=0; t=0
while [ "$t" -lt "$MAX" ]; do
  cur=$(tam "$OUT_ABS")
  if [ "$cur" -gt 0 ] && [ "$cur" -eq "$prev" ]; then
    estable=$((estable + 1))
    [ "$estable" -ge 2 ] && break     # dos sondeos sin crecer = terminado
  else
    estable=0
  fi
  prev=$cur; sleep 0.5; t=$((t + 1))
  kill -0 "$PID" 2>/dev/null || { sleep 0.5; break; }   # salio solo
done

[ -s "$OUT_ABS" ] || { echo "Fallo el render. Revisa que la maqueta abra bien y que haya red para las fuentes." >&2; exit 1; }
echo "Render OK -> $OUT  ($(pdfinfo "$OUT_ABS" | awk '/^Pages:/{print $2}') paginas, $(( $(tam "$OUT_ABS") / 1024 )) KB)"
