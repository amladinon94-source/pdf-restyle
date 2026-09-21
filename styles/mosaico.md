# Mosaico

**Referencia:** libro de arte en blanco y negro, con una palabra ultra condensada
gigantesca y una retícula de fotografías.
**Cuándo usarlo:** catálogos, archivos fotográficos, memorias culturales,
cualquier documento con **mucha imagen y poco texto**.
**Sensación:** archivo. Sobrio, contundente, sin color que distraiga.
**Voz sugerida:** editorial

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 18mm; --margin-h: 16mm;
  --cols: 12; --gutter: 2.5mm;

  --font-display: 'Anton', 'Helvetica Neue', sans-serif;
  --font-text: 'Inter', -apple-system, system-ui, sans-serif;
  --font-etiqueta: 'EB Garamond', Georgia, serif;
  --size-body: 10pt; --leading: 1.55;
  --size-h1: 130pt; --size-h2: 14pt; --size-h3: 10pt;

  --bg: #FFFFFF; --ink: #181818; --accent: #C0281E; --muted: #9A9A9A;
  --parrafo-gap: 4mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;600&family=EB+Garamond:wght@400;500&display=swap
```

## Cómo se comporta

- **Una palabra por apertura, y descomunal.** `PASADO`, `OBRA`, `ORIGEN`. Anton a
  130pt o más, tracking −0,04em, pegada al margen izquierdo y al pie.
- **Mosaico de fotografías** en retícula apretada: gutter de 2,5mm, imágenes de
  alturas distintas que encajan a ras. Las fotos se tocan casi sin aire; ese
  apretón es el estilo.
- **Todo en blanco y negro.** El rojo aparece únicamente en la etiqueta de
  sección, en versalitas serif a 8pt centradas. En ningún otro sitio.
- **Numeral de sección en un cuadro negro** de 8×8mm con la cifra en blanco, a la
  izquierda de la etiqueta.
- **Filetes finos de 0,5pt** por encima y por debajo del bloque de etiqueta.
- **Folios clásicos**: número al exterior, nombre de la obra centrado, a 7,5pt en
  gris.
- El texto de entrada va arriba, en una columna ancha, y respira.

## Gestos activos

Palabra `esc-xl` a 130pt pegada al pie · mosaico con gutter de 2,5mm ·
numeral en cuadro negro · etiqueta en versalitas serif rojas · sin fantasma
(aquí el blanco es el gesto).

```gestos
:root { --esc-xl: 130pt; --esc-l: 22pt; --esc-xs: 7.5pt; --ico: 4mm; }
.palabra { font-family: var(--font-display); font-size: 130pt; line-height: .76;
           letter-spacing: -.045em; color: var(--ink); text-transform: uppercase;
           margin: 0; display: block; }
.mosaico { display: grid; grid-template-columns: repeat(3, 1fr); gap: 2.5mm; }
.mosaico img { width: 100%; height: 100%; object-fit: cover; display: block;
               filter: grayscale(1); }
.mosaico .alto { grid-row: span 2; }
.mosaico .ancho { grid-column: span 2; }
.sec-mark { display: flex; align-items: center; gap: 4mm; margin: 6mm 0 3mm;
            border-top: .5pt solid var(--ink); border-bottom: .5pt solid var(--ink);
            padding: 2.5mm 0; }
.sec-num { width: 8mm; height: 8mm; background: var(--ink); color: #fff;
           font-family: var(--font-display); font-size: 11pt; display: flex;
           align-items: center; justify-content: center; }
.sec-tit { font-family: var(--font-etiqueta); font-variant: small-caps;
           font-size: 8.5pt; letter-spacing: .14em; color: var(--accent); flex: 1;
           text-align: center; }
.folio-ext { position: absolute; bottom: 10mm; left: var(--margin-h);
             right: var(--margin-h); display: flex; justify-content: space-between;
             font-size: 7.5pt; color: var(--muted); letter-spacing: .1em;
             text-transform: uppercase; }
```

## Límites
La palabra gigante funciona en celular; el mosaico de fotos no —las imágenes
quedan de 2cm—. En vertical, pasa el mosaico a dos columnas como máximo.
