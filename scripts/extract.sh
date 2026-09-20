#!/usr/bin/env bash
# extract.sh <entrada.pdf> <dir-trabajo>
# Extrae texto, imagenes a resolucion nativa y miniaturas de pagina.
set -euo pipefail
PDF="$1"; W="${2:-work}"
mkdir -p "$W"/{assets,paginas}

pdfinfo "$PDF" > "$W/info.txt"
pdftotext -layout "$PDF" "$W/texto.txt"
pdftotext -layout -bbox "$PDF" "$W/texto-bbox.html" 2>/dev/null || true

# Imagenes en su codificacion original: -j deja los JPEG como JPEG, sin recodificar.
pdfimages -all -p "$PDF" "$W/assets/img" 2>/dev/null || true
pdfimages -list "$PDF" > "$W/imagenes.txt" 2>/dev/null || true

# Miniaturas para leer visualmente la maqueta original.
pdftoppm -png -r 60 "$PDF" "$W/paginas/p" 2>/dev/null || true

# Graficos vectoriales (logos, ilustraciones dibujadas con paths).
# No son imagenes: pdfimages no los ve. Se sacan como SVG y escalan sin limite.
mkdir -p "$W/vectores"
PAGS=$(grep -i '^Pages:' "$W/info.txt" | awk '{print $2}')
for p in $(seq 1 "${PAGS:-1}"); do
  pdftocairo -svg -f $p -l $p "$PDF" "$W/vectores/p$p.svg" 2>/dev/null || true
done

echo "Extraido en $W/"
echo "  paginas:   ${PAGS:-?}"
echo "  imagenes:  $(ls -1 "$W/assets" 2>/dev/null | wc -l | tr -d ' ')"
echo "  miniaturas: $(ls -1 "$W/paginas" 2>/dev/null | wc -l | tr -d ' ')"
