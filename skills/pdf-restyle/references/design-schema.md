# Contrato de un archivo de estilo

Un estilo es un `.md` en `~/.claude/pdf-restyle/styles/`. Legible para una
persona, y con un bloque ```css``` que se inyecta **tal cual** en la maqueta.
Sin capa de traducción: lo que está en el bloque es lo que llega al render.

    # Nombre del estilo

    **Cuándo usarlo:** ...
    **Sensación:** ...
    **Voz sugerida:** amigable-cercano

    ```css
    :root { --font-display: ...; --bg: ...; }
    ```

    ```fonts
    https://fonts.googleapis.com/css2?family=...
    ```

    ## Reglas propias
    - Frases en prosa que el CSS no puede expresar

Las **Reglas propias** las lee el modelo al diagramar: deciden cosas como dónde
va un salto de sección o si la portada lleva imagen a sangre.

## Tokens disponibles

| Token | Para qué |
|---|---|
| `--page`, `--page-w`, `--page-h` | Formato |
| `--margin-v`, `--margin-h` | Márgenes |
| `--cols`, `--gutter` | Rejilla |
| `--font-display`, `--font-text` | Familias |
| `--size-body`, `--leading`, `--size-h1/2/3` | Escala |
| `--bg`, `--ink`, `--accent`, `--muted` | Color |
| `--img-ratio` | Relación de aspecto por defecto |
| `--parrafo-gap` | Aire entre párrafos |

## Variantes sin duplicar

    # Editorial cálido — Cuadrado
    extends: editorial-calido

    ```css
    :root { --page: 200mm 200mm; --page-w: 200mm; --page-h: 200mm; --size-h1: 34pt; }
    ```

## Orden de resolución

    _base.css  →  estilo  →  design.md del proyecto  →  lo que se pida en el chat

Gana el último. Los ajustes del chat no tocan archivos; al terminar se pregunta
si se consolidan en el estilo.


## Formato y destino

El ancho de página no es una preferencia estética: decide si el documento se
puede leer. En un celular el visor ajusta el ancho de página al de pantalla, así
que el tamaño aparente del texto es `cuerpo_pt × (68 ÷ ancho_mm) × 1,33`.

Un estilo pensado para celular lleva estos tokens:

```css
:root {
  --page: 120mm 213mm; --page-w: 120mm; --page-h: 213mm;   /* 9:16 */
  --margin-v: 14mm; --margin-h: 12mm;
  --size-body: 13pt; --leading: 1.6;
}
```

Y uno para impresión, los de siempre (A4, cuerpo 10-11pt, márgenes 20-24mm).

**Un mismo estilo puede tener las dos variantes** con `extends:`. Ver
`lectura-en-celular.md` para la tabla completa y el chequeo de verificación.
