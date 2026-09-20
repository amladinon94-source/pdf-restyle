# Manual claro

**Cuándo usarlo:** instructivos paso a paso donde lo único que importa es que
se entienda y se pueda seguir con las manos ocupadas.
**Sensación:** señalética, alto contraste, pasos enormes, cero decoración.
**Voz sugerida:** claro-neutro

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 20mm; --margin-h: 18mm;
  --cols: 12; --gutter: 6mm;

  --font-display: 'Inter', system-ui, sans-serif;
  --font-text: 'Inter', system-ui, sans-serif;
  --size-body: 12pt; --leading: 1.5;
  --size-h1: 32pt; --size-h2: 19pt; --size-h3: 14pt;

  --bg: #FFFFFF; --ink: #000000; --accent: #C2410C; --muted: #6B7280;
  --img-ratio: 3/2;
  --parrafo-gap: 4mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap
```

## Reglas propias
- Cuerpo de texto grande: se lee de pie, a distancia de brazo
- Un paso por bloque, con su imagen al lado, nunca dos pasos compartiendo foto
- Los avisos de seguridad van en caja, siempre antes del paso que los necesita
- Máximo cuatro pasos por página
- Nada de cursivas: baja la legibilidad a distancia
