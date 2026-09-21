# Ácido

**Referencia:** revista digital sobre negro con un amarillo ácido, titulares
condensados enormes cortados a media palabra y navegación en píldoras.
**Cuándo usarlo:** contenido cultural, fanzines, piezas para pantalla, material
que quiere sentirse joven y ruidoso. **Nació en vertical**: es el más nativo de
celular de toda la serie.
**Sensación:** pantalla encendida en un cuarto oscuro.
**Voz sugerida:** amigable-cercano

```css
:root {
  --page: 120mm 213mm; --page-w: 120mm; --page-h: 213mm;
  --margin-v: 12mm; --margin-h: 10mm;
  --cols: 6; --gutter: 4mm;

  --font-display: 'Archivo Black', 'Helvetica Neue', sans-serif;
  --font-text: 'Archivo', -apple-system, system-ui, sans-serif;
  --font-mono: 'Space Mono', ui-monospace, monospace;
  --size-body: 12pt; --leading: 1.5;
  --size-h1: 42pt; --size-h2: 15pt; --size-h3: 11pt;

  --bg: #0A0A0A; --ink: #FCE400; --accent: #FCE400; --muted: #6C6C48;
  --alt-bg: #6C6C48;          /* oliva: la segunda cara de la serie */
  --parrafo-gap: 4mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Archivo+Black&family=Archivo:wght@400;600&family=Space+Mono:wght@400;700&display=swap
```

## Cómo se comporta

- **Negro de fondo y un solo amarillo.** El oliva entra como fondo alterno en
  algunas páginas, nunca como tercer color en la misma.
- **El titular se corta a media palabra** cuando llega al borde:
  `CRAFTSMA / NSHIP`. No es un error, es el gesto central. Caja alta, interlínea
  0,88, tracking −0,03em.
- **Botones píldora** con borde de 1pt y esquinas totalmente redondeadas para
  navegación y llamadas: `INICIO` `BLOG (24)` `GALERÍA`. Van en fila arriba.
- **Micro-etiquetas en monoespaciada**: `//01-03`, `#77825`, `(Número:)`. Marcan
  posición y dan el aire de interfaz.
- **Fotografía a sangre con el titular encima**, siempre en amarillo. La foto
  nunca lleva filtro; el contraste lo pone el tipo.
- Texto corrido en una columna estrecha, a la derecha, dejando el peso visual a
  la izquierda.

## Gestos activos

Titular cortado a media palabra · botones píldora · texto `sobre` la fotografía ·
micro-etiquetas monoespaciadas · iconografía de trazo grueso en amarillo.

```gestos
:root { --esc-xl: 42pt; --esc-xs: 9pt; --ico: 5mm; --ico-caja: 10mm;
        --ico-borde: 1pt solid var(--accent); --ico-fondo: transparent;
        --sobre-color: var(--accent); --sobre-bottom: 10mm;
        --velo: linear-gradient(to top, rgba(0,0,0,.72), transparent 55%);
        --fantasma-color: var(--accent); --fantasma-op: .12; --fantasma-size: 150pt; }
.corte { font-family: var(--font-display); font-size: 42pt; line-height: .88;
         letter-spacing: -.03em; text-transform: uppercase; color: var(--accent);
         word-break: break-all; overflow-wrap: anywhere; margin: 0 0 5mm; }
.pills { display: flex; gap: 2mm; flex-wrap: wrap; margin-bottom: 6mm; }
.pill { border: 1pt solid var(--accent); border-radius: 99mm; padding: 1.4mm 4mm;
        font-size: 8pt; font-weight: 600; text-transform: uppercase;
        letter-spacing: .06em; display: flex; align-items: center; gap: 1.5mm; }
.pill--on { background: var(--accent); color: var(--bg); }
.mono { font-family: var(--font-mono); font-size: 8.5pt; color: var(--muted);
        letter-spacing: .04em; display: block; margin-bottom: 5mm; }
.ico { stroke-width: 2.1; }
.tarj, .tip, .avi, .rec, .destacado, .sino .si, .sino .no { background: var(--alt-bg); }
```

## Límites
Sobre negro, el cuerpo por debajo de 11pt se cierra. No bajes de ahí. Y si el
documento se va a imprimir, avisa: gasta muchísima tinta.
