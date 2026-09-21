# Hueso y naranja

**Referencia:** identidades de marca serenas sobre fondo crema, con un solo
naranja y fotografía en bloques.
**Cuándo usarlo:** presentaciones de marca, propuestas, programas, documentos que
tienen que sentirse cuidados y tranquilos. El más versátil de la serie.
**Sensación:** calma. Nada grita; el naranja aparece una vez y se nota.
**Voz sugerida:** amigable-cercano

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 20mm; --margin-h: 18mm;
  --cols: 12; --gutter: 6mm;

  --font-display: 'DM Sans', -apple-system, system-ui, sans-serif;
  --font-text: 'DM Sans', -apple-system, system-ui, sans-serif;
  --size-body: 10pt; --leading: 1.62;
  --size-h1: 30pt; --size-h2: 17pt; --size-h3: 11pt;

  --bg: #F2EAE0; --ink: #1A1A1A; --accent: #E45424; --muted: #9A9186;
  --panel: #E8DED2;
  --parrafo-gap: 4mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=DM+Sans:opsz,wght@9..40,400;9..40,500;9..40,700&display=swap
```

## Cómo se comporta

- **Fondo hueso, nunca blanco puro.** Es lo que da el tono cálido de toda la pieza.
- **El naranja aparece una vez por página**: en el titular, o en un bloque, o en
  una etiqueta. Nunca en dos sitios a la vez.
- **Micro-etiqueta arriba a la izquierda**, en caja alta con tracking amplio
  (0,2em) y cuerpo de 8pt. Ancla la página como una cabecera de marca.
- **La fotografía va en rectángulos netos**, sin bordes redondeados ni sombras,
  ocupando media caja o el ancho completo. Nunca recortada en círculo.
- **Inversión ocasional**: una página entera en naranja con el texto en hueso.
  Una cada seis u ocho, para dar respiro.
- Aire generoso. Si dudas entre meter algo o dejar el hueco, deja el hueco.
- Un filete finísimo (0,4pt) al pie, con el nombre del programa o sección.

## Gestos activos

Titular `sobre` la fotografía con veladura · inversión completa cada siete
páginas · iconografía en las micro-etiquetas · filete al pie.

```gestos
:root { --esc-xl: 30pt; --esc-xs: 8pt; --ico: 4.5mm; --ico-caja: 9mm;
        --ico-fondo: var(--panel); --ico-borde: 0;
        --sobre-color: var(--bg); --sobre-bottom: 9mm;
        --velo: linear-gradient(to top, rgba(26,26,26,.55), transparent 58%);
        --fantasma-op: .05; --fantasma-size: 120pt; }
.mrk { display: flex; align-items: center; gap: 2.5mm; font-weight: 700;
       font-size: 8.5pt; letter-spacing: .2em; text-transform: uppercase;
       color: var(--muted); margin-bottom: 6mm; }
.pg--inv { background: var(--accent); }
.pg--inv, .pg--inv h1, .pg--inv h2, .pg--inv h3, .pg--inv p, .pg--inv li { color: var(--bg); }
.pg--inv .mrk { color: rgba(255,255,255,.72); }
.pie-f { position: absolute; bottom: 7mm; left: var(--margin-h); right: var(--margin-h);
         border-top: .4pt solid var(--muted); padding-top: 2mm; font-size: 7.5pt;
         color: var(--muted); letter-spacing: .1em; text-transform: uppercase;
         display: flex; justify-content: space-between; }
.lista-ico { list-style: none; padding: 0; margin: 0; }
.lista-ico li { display: flex; align-items: center; gap: 3.5mm; padding: 2.5mm 0;
                border-bottom: .4pt solid rgba(0,0,0,.08); }
```

## Límites
Es el que mejor aguanta la variante celular sin retoques: sube el cuerpo a 13pt,
pasa a 120mm de ancho y funciona igual.
