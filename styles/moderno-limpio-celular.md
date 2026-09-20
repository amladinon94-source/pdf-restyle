# Moderno limpio — Celular

**Cuándo usarlo:** cuando el documento se va a leer en el teléfono, que es casi
siempre. Variante vertical 9:16 de `moderno-limpio`.
**Voz sugerida:** la misma que la variante base.

extends: moderno-limpio

```css
:root {
  --page: 120mm 213mm; --page-w: 120mm; --page-h: 213mm;
  --margin-v: 14mm; --margin-h: 12mm;
  --margin-ancho: 12mm;
  --cols: 6; --gutter: 4mm;
  --size-body: 13pt; --leading: 1.6;
  --size-h1: 30pt; --size-h2: 17pt; --size-h3: 13pt;
  --parrafo-gap: 5mm;
}
```

## Reglas propias
- **Una sola columna.** Dos columnas obligan a subir y bajar en pantalla.
- **Línea de 38 a 45 caracteres.** Con 96mm de caja y 13pt sale sola.
- **Más páginas y está bien.** En pantalla las páginas no cuestan; el zoom sí.
- Nada de notas al margen: no hay margen que las aloje.
- Verificar siempre con `pdftoppm -png -scale-to-x 680` y leer sin ampliar.
