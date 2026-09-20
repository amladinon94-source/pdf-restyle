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

## Límites
Sobre negro, el cuerpo por debajo de 11pt se cierra. No bajes de ahí. Y si el
documento se va a imprimir, avisa: gasta muchísima tinta.
