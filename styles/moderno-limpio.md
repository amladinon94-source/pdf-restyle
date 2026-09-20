# Moderno limpio

**Cuándo usarlo:** guías, manuales de producto y material didáctico que tiene
que verse actual y leerse sin fricción. Cuando la prioridad es claridad, no
personalidad.
**Sensación:** blanco, aire, una sola familia tipográfica y un acento. Nada
decorativo: la jerarquía la hacen el tamaño, el peso y el espacio.
**Voz sugerida:** amigable-cercano

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 24mm; --margin-h: 22mm;
  --cols: 12; --gutter: 6mm;

  --font-display: 'Manrope', -apple-system, system-ui, sans-serif;
  --font-text: 'Manrope', -apple-system, system-ui, sans-serif;
  --size-body: 10pt; --leading: 1.62;
  --size-h1: 34pt; --size-h2: 18pt; --size-h3: 12pt;

  --bg: #FFFFFF; --ink: #1A1D22; --accent: #102038; --muted: #98A0AA;
  --suave: #A8906E;          /* filetes y detalles calidos */
  --panel: #F5F6F8;          /* fondo de avisos y paneles */
  --img-ratio: auto;
  --parrafo-gap: 4mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;800&display=swap
```

## Reglas propias
- **Una sola familia tipográfica.** La jerarquía sale del peso y del tamaño,
  nunca de mezclar tipografías.
- **Un solo acento.** Aparece en títulos, numerales de paso y marcas; nunca en
  texto corrido ni en fondos grandes.
- **Sin filetes decorativos.** Solo separadores funcionales, a 0,4pt.
- **Fotografía a sangre**, en bandas horizontales que cortan la página de lado a
  lado. El texto nunca se sobreimprime encima.
- **Los paneles son grises muy claros, sin borde.** Un aviso se distingue por el
  fondo, no por una caja.
- Texto en bandera, nunca justificado. Márgenes generosos y simétricos: la
  limpieza pide simetría, no asimetría.

## Recortar fotos sin tocar el archivo
Cuando el original trae la foto fundida con texto en la misma imagen, se recorta
**por CSS** —un contenedor con `overflow: hidden` y la imagen al 100% de ancho—
en vez de reprocesar el archivo. Así la imagen llega intacta al PDF y no se
rompe la regla de no retocar. Recortar de verdad exigiría recomprimir.
