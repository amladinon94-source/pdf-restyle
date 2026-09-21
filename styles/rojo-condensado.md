# Rojo condensado

**Referencia:** libros de proyecto con campo rojo a sangre, titular condensado
apilado y numeral fantasma gigante.
**Cuándo usarlo:** portafolios, catálogos de proyectos, memorias con secciones
numeradas. Cuando cada capítulo debe golpear al abrirlo.
**Sensación:** cartel dentro de un libro. Denso y ruidoso, a propósito.
**Voz sugerida:** editorial

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 18mm; --margin-h: 16mm;
  --cols: 12; --gutter: 5mm;

  --font-display: 'Barlow Condensed', 'Helvetica Neue', sans-serif;
  --font-text: 'Barlow', -apple-system, system-ui, sans-serif;
  --size-body: 8pt; --leading: 1.4;
  --size-h1: 54pt; --size-h2: 15pt; --size-h3: 10pt;

  --bg: #FC3C18; --ink: #FFFFFF; --accent: #FFFFFF; --muted: #FFB8A4;
  --fantasma: rgba(255,255,255,.18);
  --parrafo-gap: 3mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@500;600;700&family=Barlow:wght@400;500;600&display=swap
```

## Cómo se comporta

- **Rojo a sangre en toda la página.** El blanco es la tinta, no el fondo.
- **Titular condensado en caja alta, apilado en líneas cortas**, interlínea 0,92
  —las líneas casi se tocan— y tracking −0,02em. Se rompe por sentido, no por
  ancho.
- **Numeral de sección gigantesco detrás del texto**, a 250pt o más, en blanco al
  18% de opacidad. Se sale de la página por abajo: el corte es intencional.
- **Texto en 3 o 4 columnas** de 8pt, justificado, muy denso. El contraste entre
  el titular enorme y el bloque compacto es el efecto.
- Micro-etiquetas arriba: sección, proyecto, año, separadas por espacios largos.
- **Sin filetes, sin cajas, sin fotografía.** Solo color, tipografía y escala.

## Gestos activos

`fantasma` numeral a 250pt al 18% saliéndose por abajo · titular apilado con
interlínea 0,92 · tres columnas de 8pt · iconografía mínima en las cornisas.

```gestos
:root { --fantasma-size: 250pt; --fantasma-color: #fff; --fantasma-op: .18;
        --esc-xl: 54pt; --esc-xs: 8pt; --ico: 4mm; }
.pg { position: relative; }
h1, h2.cap-t { font-family: var(--font-display); text-transform: uppercase;
               line-height: .92; letter-spacing: -.02em; }
.tres-cols { column-count: 3; column-gap: 5mm; font-size: 8pt; text-align: justify;
             hyphens: auto; }
.marca-sup { display: flex; gap: 10mm; font-size: 6.5pt; letter-spacing: .18em;
             text-transform: uppercase; margin-bottom: 8mm; align-items: center; }
.ico { stroke-width: 2; }
.fantasma--br { bottom: -22mm; right: -10mm; }
```

## Límites
El cuerpo a 8pt sobre rojo es exigente. Para lectura larga, baja la densidad a 2
columnas y sube a 10pt, o usa la variante celular.
