# Minimal experimental — Celular

**Cuándo usarlo:** cuando el documento se lee en el teléfono. Variante vertical
9:16 de `minimal-experimental`.
**Voz sugerida:** la misma que la variante base.

extends: minimal-experimental

```css
:root {
  --page: 120mm 213mm; --page-w: 120mm; --page-h: 213mm;
  --margin-v: 14mm; --margin-h: 12mm;
  --cols: 6; --gutter: 4mm;
  --size-body: 13pt; --leading: 1.6;
  --size-h1: 40pt; --size-h2: 19pt; --size-h3: 13pt;
  --parrafo-gap: 5mm;
}
```

## Reglas propias
- **Una sola columna.** La asimetría alternada se conserva, pero el margen ancho baja de 46 a 24mm: sobre 120mm, 46 se come el 38%.
- Línea de 38 a 45 caracteres: con 96mm de caja y 13pt sale sola.
- Verificar con `pdftoppm -png -scale-to-x 680` y leer sin ampliar.
