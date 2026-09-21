# Dato gigante — Celular

**Cuándo usarlo:** cuando el documento se lee en el teléfono. Variante vertical
9:16 de `dato-gigante`.
**Voz sugerida:** la misma que la variante base.

extends: dato-gigante

```css
:root {
  --page: 120mm 213mm; --page-w: 120mm; --page-h: 213mm;
  --margin-v: 12mm; --margin-h: 12mm;
  --cols: 6; --gutter: 4mm;
  --size-body: 13pt; --leading: 1.6;
  --size-h1: 96pt; --size-h2: 16pt; --size-h3: 13pt;
  --parrafo-gap: 5mm;
}
```

## Reglas propias
- **Una sola columna.** El dato baja de 150pt a 96pt: sigue siendo enorme en una página de 120mm. Las micro-columnas desaparecen — en vertical no caben cuatro columnas de 7,5pt.
- Línea de 38 a 45 caracteres: con 96mm de caja y 13pt sale sola.
- Verificar con `pdftoppm -png -scale-to-x 680` y leer sin ampliar.
