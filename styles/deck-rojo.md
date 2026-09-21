# Deck rojo

**Referencia:** presentación de agencia sobre hueso con un solo rojo, logotipo
repetido como ancla y bloques modulares de fotografía.
**Cuándo usarlo:** presentaciones, dosieres de agencia, credenciales,
propuestas comerciales. Formato apaisado por naturaleza.
**Sensación:** sistema. Todas las páginas se reconocen como la misma familia.
**Voz sugerida:** institucional

```css
:root {
  --page: 297mm 210mm;        /* apaisado */
  --page-w: 297mm; --page-h: 210mm;
  --margin-v: 14mm; --margin-h: 16mm;
  --cols: 12; --gutter: 5mm;

  --font-display: 'Archivo', 'Helvetica Neue', sans-serif;
  --font-text: 'Archivo', -apple-system, system-ui, sans-serif;
  --size-body: 8.5pt; --leading: 1.5;
  --size-h1: 44pt; --size-h2: 13pt; --size-h3: 9pt;

  --bg: #E8E6DA; --ink: #1A1A1A; --accent: #CC3030; --muted: #8E8B80;
  --parrafo-gap: 3mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Archivo:wght@400;500;600;800&display=swap
```

## Cómo se comporta

- **Fondo hueso y un solo rojo.** El negro se reserva para el texto de lectura.
- **El logotipo se repite abajo a la derecha en todas las páginas**, siempre en
  rojo y siempre del mismo tamaño. Es el ancla que convierte páginas sueltas en
  una serie.
- **Rejillas de cifras**: números grandes en filas de tres o cuatro con su
  etiqueta minúscula debajo —`07 agentes`, `14 estilistas`—. Cuerpo 30pt para la
  cifra, 7pt para la etiqueta.
- **La fotografía va en bloques pequeños**, dos o tres por página, nunca a
  sangre. Alturas iguales, anchos distintos.
- **Inversión completa a rojo** una página de cada cinco: fondo rojo, tipografía
  hueso, foto recortada encima. Marca los cambios de bloque.
- **Micro-texto en caja alta** a 6,5pt con tracking amplio en las esquinas:
  datos de contacto, fecha, número de página.
- Índice final en retícula de miniaturas, todas del mismo tamaño.

## Gestos activos

Logotipo ancla repetido abajo a la derecha · rejilla de cifras · inversión
completa a rojo una de cada cinco · bloques de foto pequeños · iconografía en
los rótulos.

```gestos
:root { --cifra-size: 30pt; --cifra-color: var(--ink);
        --esc-xl: 44pt; --esc-xs: 7pt; --esc-micro: 6.5pt; --ico: 4.5mm;
        --fantasma-op: .07; --fantasma-size: 130pt; }
.ancla { position: absolute; bottom: var(--margin-v); right: var(--margin-h);
         font-family: var(--font-display); font-weight: 800; font-size: 13pt;
         letter-spacing: -.03em; color: var(--accent); }
.rejilla { display: grid; grid-template-columns: repeat(4, 1fr); gap: 5mm;
           margin: 6mm 0; }
.rejilla .n { font-family: var(--font-display); font-weight: 800; font-size: 30pt;
              line-height: .9; letter-spacing: -.04em; color: var(--ink); display: block; }
.rejilla .e { font-size: 7pt; letter-spacing: .12em; text-transform: uppercase;
              color: var(--muted); margin-top: 1.5mm; display: block; }
.bloques { display: grid; grid-template-columns: 1.4fr 1fr 1.2fr; gap: 4mm; }
.bloques img { width: 100%; height: 42mm; object-fit: cover; display: block; }
.pg--inv { background: var(--accent); }
.pg--inv, .pg--inv h1, .pg--inv h2, .pg--inv h3, .pg--inv p, .pg--inv li,
.pg--inv .n { color: var(--bg); }
.pg--inv .ancla { color: var(--bg); }
.esq { position: absolute; top: var(--margin-v); right: var(--margin-h);
       font-size: 6.5pt; letter-spacing: .16em; text-transform: uppercase;
       color: var(--muted); }
```

## Límites
Es apaisado. En celular obliga a girar el teléfono, así que **si el destino es
pantalla vertical, este no es el estilo** — usa `hueso-naranja` o `panel-modular`.
