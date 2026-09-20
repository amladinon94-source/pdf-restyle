# Nórdico minimal

**Cuándo usarlo:** contenido técnico o de producto que necesita respirar —
manuales de diseño, documentación, portafolios, informes.
**Sensación:** blanco, silencioso, mucha grilla, tipografía sin adornos.
**Voz sugerida:** claro-neutro

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 28mm; --margin-h: 24mm;
  --cols: 12; --gutter: 8mm;

  --font-display: 'Inter', -apple-system, system-ui, sans-serif;
  --font-text: 'Inter', -apple-system, system-ui, sans-serif;
  --size-body: 9.5pt; --leading: 1.6;
  --size-h1: 28pt; --size-h2: 15pt; --size-h3: 11pt;

  --bg: #FFFFFF; --ink: #16181A; --accent: #2B6CB0; --muted: #A8AEB4;
  --img-ratio: 16/9;
  --parrafo-gap: 4mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap
```

## Reglas propias
- Sin imágenes a sangre: todo dentro del margen, la grilla se respeta siempre
- Los títulos van en el mismo cuerpo tipográfico que el texto, solo cambia el peso
- El color de acento se usa una sola vez por página, como máximo
- Mucho espacio en blanco arriba de cada apertura de sección
- Captions arriba de la imagen, no debajo
