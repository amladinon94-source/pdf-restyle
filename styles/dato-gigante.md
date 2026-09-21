# Dato gigante

**Referencia:** informes sectoriales suizos de los setenta — campo de color plano
y una sola cifra descomunal por página.
**Cuándo usarlo:** informes, memorias, resultados, cualquier documento donde **el
dato es el protagonista** y el texto lo sustenta.
**Sensación:** rigor modernista. Nada es decorativo; el número *es* la imagen.
**Voz sugerida:** claro-neutro

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 16mm; --margin-h: 14mm;
  --cols: 12; --gutter: 4mm;

  --font-display: 'Archivo', 'Helvetica Neue', sans-serif;
  --font-text: 'Archivo', 'Helvetica Neue', sans-serif;
  --size-body: 7.5pt; --leading: 1.32;
  --size-h1: 150pt; --size-h2: 11pt; --size-h3: 8pt;

  --bg: #FCA848; --ink: #241C14; --accent: #241C14; --muted: #8C6430;
  --alt-bg: #E490B4;          /* la otra cara de la serie: rosa */
  --parrafo-gap: 2.5mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Archivo:wght@400;600;800;900&display=swap
```

## Cómo se comporta

- **Un dato por página, y es enorme.** La cifra ocupa entre un tercio y la mitad
  del alto. Peso 900, tracking muy negativo (−0,05em), alineada abajo.
- **La cifra lleva trama de medio tono**, no color plano: puntos al 45° que la
  vuelven textura. Es la firma del estilo.
- **El texto es micro y va en columnas estrechas**: 4 a 6 columnas, cuerpo de
  7,5pt, interlínea apretada. Contrasta con la cifra en relación 1:20.
- **Campo de color saturado a sangre**, sin márgenes blancos. Alternar naranja y
  rosa entre secciones da ritmo a la serie.
- **Tipografía ghost**: una palabra clave gigante al 8% de opacidad detrás del
  texto, cortada por el borde.
- Un solo filete fino separa el bloque de texto del dato. Nada más.

## Gestos activos

`cifra--trama` a 150pt con medio tono · `fantasma` de palabra clave ·
micro-columnas · escala 1:20 · sin iconografía (el dato es la imagen).

```gestos
:root { --cifra-size: 150pt; --cifra-color: var(--ink);
        --fantasma-size: 150pt; --fantasma-color: var(--ink); --fantasma-op: .09;
        --esc-xl: 150pt; --esc-xs: 7.5pt; --esc-micro: 6pt; --ico: 4.5mm; }
.pg { position: relative; }
.micro-cols { column-count: 4; column-gap: 4mm; font-size: 7.5pt; line-height: 1.32; }
.micro-cols h3 { font-size: 8pt; break-after: avoid; }
.dato-pie { position: absolute; bottom: var(--margin-v); left: var(--margin-h);
            right: var(--margin-h); border-top: .5pt solid var(--ink); padding-top: 3mm; }
.dato-pie .cifra { margin-top: 2mm; }
.leyenda { display: flex; gap: 8mm; font-size: 6.5pt; letter-spacing: .1em;
           text-transform: uppercase; margin-top: 2mm; }
.ico { display: none; }
```

## Límites
En celular el dato se lee perfecto, pero **las columnas de 7,5pt no.** Si el
destino es teléfono, usa este estilo solo para aperturas y pasa el cuerpo a
`dato-gigante-celular`.
