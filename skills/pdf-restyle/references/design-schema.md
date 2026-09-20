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
