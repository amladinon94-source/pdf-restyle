# Manifiesto serif — Celular

**Cuándo usarlo:** cuando el documento se lee en el teléfono. Variante vertical
9:16 de `manifiesto-serif`.
**Voz sugerida:** la misma que la variante base.

extends: manifiesto-serif

```css
:root {
  --page: 120mm 213mm; --page-w: 120mm; --page-h: 213mm;
  --margin-v: 16mm; --margin-h: 12mm;
  --cols: 6; --gutter: 4mm;
  --size-body: 13pt; --leading: 1.6;
  --size-h1: 30pt; --size-h2: 20pt; --size-h3: 13pt;
  --parrafo-gap: 5mm;
}
```

## Reglas propias
- **Una sola columna.** El enunciado en serif baja de 40 a 30pt y sigue mandando. La banda de proceso se mantiene al pie.
- Línea de 38 a 45 caracteres: con 96mm de caja y 13pt sale sola.
- Verificar con `pdftoppm -png -scale-to-x 680` y leer sin ampliar.
