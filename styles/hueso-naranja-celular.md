# Hueso y naranja — Celular

**Cuándo usarlo:** cuando el documento se lee en el teléfono. Variante vertical
9:16 de `hueso-naranja`.
**Voz sugerida:** la misma que la variante base.

extends: hueso-naranja

```css
:root {
  --page: 120mm 213mm; --page-w: 120mm; --page-h: 213mm;
  --margin-v: 14mm; --margin-h: 12mm;
  --cols: 6; --gutter: 4mm;
  --size-body: 13pt; --leading: 1.6;
  --size-h1: 28pt; --size-h2: 17pt; --size-h3: 13pt;
  --parrafo-gap: 5mm;
}
```

## Reglas propias
- **Una sola columna.** Es el que menos cambia: sube el cuerpo y ya está. La inversión a naranja se mantiene.
- Línea de 38 a 45 caracteres: con 96mm de caja y 13pt sale sola.
- Verificar con `pdftoppm -png -scale-to-x 680` y leer sin ampliar.
