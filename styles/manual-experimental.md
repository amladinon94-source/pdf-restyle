# Manual experimental

**Cuándo usarlo:** contenido técnico o instructivo que además quiere verse bien.
Manuales de oficio, guías de método, documentación con carácter.
**Sensación:** editorial contemporáneo. Escala fuerte y asimetría, pero sin
sacrificar la navegación: el contenido se consulta, no solo se contempla.
**Voz sugerida:** amigable-cercano

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 24mm; --margin-h: 22mm;
  --margin-ancho: 44mm;
  --cols: 12; --gutter: 7mm;

  --font-display: 'Bricolage Grotesque', 'Helvetica Neue', sans-serif;
  --font-text: 'Inter', -apple-system, system-ui, sans-serif;
  --size-body: 9.5pt; --leading: 1.68;
  --size-h1: 46pt; --size-h2: 17pt; --size-h3: 11pt;

  --bg: #FAF8F5; --ink: #16130F; --accent: #D04050; --muted: #9B948C;
  --img-ratio: auto;
  --parrafo-gap: 4.5mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,400;12..96,700;12..96,800&family=Inter:wght@400;500;600&display=swap
```

## Reglas propias
- **Pocos elementos por página**, pero la navegación no se negocia: aunque el
  registro sea minimalista, un manual conserva folio y cornisa con el número de
  sección. Sin eso no se puede consultar.
- **Asimetría alternada:** el bloque de texto se recuesta al lomo en impares y
  al corte en pares. El margen ancho que queda libre aloja las imágenes de
  apoyo, como marginalia.
- **Los pasos son el elemento gráfico central:** numeral grande en el acento,
  colgando fuera de la caja de texto.
- **Escala contrastada** entre display y texto, sin bajar de 1:4.
- Sin filetes decorativos. El acento aparece en numerales, avisos y folios,
  nunca en textos largos.
- Títulos en caja alta con tracking negativo; texto en bandera, sin justificar.
