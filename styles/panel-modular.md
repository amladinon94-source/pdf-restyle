# Panel modular

**Referencia:** fichas de producto tipo bento — módulos de esquinas redondeadas
dentro de un marco, un bloque de color y metadatos en monoespaciada.
**Cuándo usarlo:** dashboards impresos, fichas de resultados, one-pagers de
producto, informes de campaña. Contenido que **se consulta en trozos**, no se lee
de corrido.
**Sensación:** interfaz. Cada dato vive en su propio módulo.
**Voz sugerida:** claro-neutro

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 18mm; --margin-h: 18mm;
  --cols: 12; --gutter: 3mm;

  --font-display: 'Inter', -apple-system, system-ui, sans-serif;
  --font-text: 'Inter', -apple-system, system-ui, sans-serif;
  --font-mono: 'JetBrains Mono', ui-monospace, monospace;
  --size-body: 9.5pt; --leading: 1.55;
  --size-h1: 34pt; --size-h2: 15pt; --size-h3: 10pt;

  --bg: #E9EAEC; --ink: #1B1B1B; --accent: #E44800; --muted: #8A8D91;
  --panel: #F2F2F2; --marco: #1B1B1B;
  --radio: 3.5mm;
  --parrafo-gap: 3.5mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap
```

## Cómo se comporta

- **Todo vive en módulos** de esquinas redondeadas (3,5mm), separados por 3mm de
  aire, dentro de un marco exterior de 1,5pt en tinta.
- **Los módulos no son todos iguales**: uno ancho arriba para el título, uno
  cuadrado pequeño de acento, uno vertical para la cifra, uno grande para el
  texto. La asimetría del bento es el patrón.
- **Un solo módulo lleva el color saturado**, y dentro va la métrica principal.
  El resto son grises muy claros.
- **Los metadatos van en monoespaciada**: `client: NOVA`, `Q2`, `2026`. Es lo que
  le da el carácter de interfaz.
- **Trama diagonal a 45°** en la parte superior del módulo de color, para marcar
  la porción no alcanzada de una métrica. Funciona como barra de progreso.
- Flechas `←` `→` como navegación decorativa en las esquinas del módulo de texto.
- **Sin fotografía.** Si hace falta imagen, va un degradado radial metálico en un
  módulo pequeño.

## Gestos activos

Bento asimétrico · `trama-diag` como barra de progreso · iconografía en cada
módulo · monoespaciada en metadatos · sin fantasma (aquí la retícula manda).

```gestos
:root { --cifra-size: 46pt; --cifra-color: var(--ink);
        --esc-xl: 34pt; --esc-xs: 8pt; --ico: 5mm; --ico-caja: 10mm;
        --ico-borde: .6pt solid var(--muted); }
.bento { display: grid; grid-template-columns: 2fr 1fr; grid-auto-rows: min-content;
         gap: 3mm; border: 1.4pt solid var(--marco); border-radius: var(--radio);
         padding: 3mm; }
.mod { background: var(--panel); border-radius: calc(var(--radio) - 1.2mm); padding: 5mm; }
.mod--acc { background: var(--accent); color: #fff; position: relative; overflow: hidden; }
.mod--acc .cifra { color: #fff; }
.mod--ancho { grid-column: 1 / -1; }
.mod--prog { position: relative; }
.mod--prog .trama-diag { position: absolute; top: 0; left: 0; right: 0;
                         height: var(--prog, 34%); color: rgba(0,0,0,.55); }
.meta-mono { font-family: var(--font-mono); font-size: 8pt; letter-spacing: .02em;
             color: var(--muted); display: flex; justify-content: space-between;
             align-items: center; }
.ico-caja { background: #fff; }
```

## Límites
Funciona muy bien en celular porque los módulos se apilan. Pero **no sirve para
texto largo**: si una sección pasa de 600 caracteres, este no es el estilo.
