# Minimal experimental

**Cuándo usarlo:** cuando el contenido aguanta silencio y quieres que la pieza
se lea como diseño gráfico, no como documento. Libros de imagen, portafolios,
ensayos visuales, catálogos de autor.
**Sensación:** galería. Poquísimos elementos, colocados con audacia. El aire
hace el trabajo y la tipografía grita una sola vez por página.
**Voz sugerida:** claro-neutro

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 26mm; --margin-h: 24mm;
  --margin-ancho: 46mm;      /* margen exterior generoso, asimetrico */
  --cols: 12; --gutter: 7mm;

  --font-display: 'Syne', 'Helvetica Neue', sans-serif;
  --font-text: 'Inter', -apple-system, system-ui, sans-serif;
  --size-body: 9pt; --leading: 1.75;
  --size-h1: 54pt; --size-h2: 19pt; --size-h3: 11pt;

  --bg: #F2EDE3; --ink: #14110D; --accent: #E43C00; --muted: #A79E90;
  --img-ratio: auto;
  --parrafo-gap: 5mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&family=Inter:wght@400;500&display=swap
```

## Reglas propias
- **Un elemento por página.** Si hay duda entre poner algo o no ponerlo, no se pone.
- **Asimetría alternada:** el contenido se recuesta hacia el lomo en las páginas
  impares y hacia el corte en las pares. Nunca centrado.
- **Escala contrastada:** la relación entre el display y el texto no baja de 1:5.
  Un título enorme conviviendo con texto pequeño es el gesto central.
- **Sin filetes, sin cornisas, sin adornos.** La jerarquía la hace el tamaño y
  la posición, nunca una línea.
- **El folio es un elemento gráfico**, no una nota al pie: grande, en el acento,
  en la esquina exterior.
- **El color va en bloques planos**, nunca en textos largos ni en degradados.
- Los títulos en caja alta con tracking negativo; el texto en bandera, sin justificar.
