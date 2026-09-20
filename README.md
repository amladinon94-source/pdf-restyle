# PDF Restyle

Plugin de [Claude Code](https://claude.com/claude-code) que toma un PDF, lo
entiende, lo traduce al español y lo **vuelve a maquetar** con el estilo visual
y la voz que elijas.

No retoca las imágenes: las conserva intactas y las reorganiza.

```
/restyle arreglos.pdf
```

Te hace seis preguntas, te muestra una muestra, y entrega un PDF nuevo.

---

## Qué hace

- **Entiende el PDF** — lee el texto y también las miniaturas de cada página,
  así reconoce qué es título, qué es paso y qué imagen va con qué sección
- **Traduce al español** si viene en otro idioma
- **Aplica una voz** — amigable, neutra, editorial o institucional, con el
  tratamiento que elijas (tú / usted / impersonal)
- **Re-maqueta** con tokens de un archivo de estilo que puedes editar
- **Agrega aparato editorial** — portada, tabla de contenido con números reales,
  folios, cornisas, aperturas de sección y créditos
- **Conserva las imágenes sin pérdida** — el JPEG original viaja byte a byte al
  PDF nuevo

## Lo que nunca hace

La voz cambia la envoltura, **no el dato**. Cantidades, medidas, tiempos,
materiales, advertencias de seguridad, marcas y el orden de los pasos quedan
bloqueados, y al terminar se verifica que sigan ahí. Si «12 tallos» se volvió
«unos cuantos tallos», eso se reporta como error.

Tampoco retoca imágenes ni inventa información que no estuviera en el original.

---

## Instalación

```
/plugin marketplace add amladinon94-source/pdf-restyle
/plugin install pdf-restyle@pdf-restyle
```

### Requisitos

| | |
|---|---|
| **Google Chrome** | El motor de render. Casi seguro ya lo tienes. |
| **poppler** | La única dependencia que quizá falte. |
| **Python 3** | Viene de fábrica en macOS y Linux. |

```bash
brew install poppler                # macOS
sudo apt install poppler-utils      # Debian / Ubuntu
sudo dnf install poppler-utils      # Fedora
```

El plugin corre un `doctor` antes de empezar y te dice exactamente qué falta.

---

## Estilos y voces

En la primera corrida se copian a `~/.claude/pdf-restyle/`. Viven fuera del
plugin a propósito: las actualizaciones no te los borran.

**Estilos** — `editorial-calido` · `nordico-minimal` · `artesanal-vintage` ·
`manual-claro`
**Voces** — `amigable-cercano` · `claro-neutro` · `editorial` · `institucional`

Un estilo es un markdown legible con un bloque CSS que se inyecta tal cual:

````markdown
# Editorial cálido

**Cuándo usarlo:** contenido narrativo con fotografía.
**Voz sugerida:** amigable-cercano

```css
:root {
  --font-display: 'Fraunces', Georgia, serif;
  --bg: #FBF7F0; --ink: #1F1B16; --accent: #0F3D2E;
  --margin-v: 24mm; --img-ratio: 4/5;
}
```

## Reglas propias
- Portada con imagen a sangre, título sobreimpreso abajo
- Aperturas de sección en página impar
````

Las **reglas propias** en prosa las lee el modelo al diagramar: deciden lo que
el CSS no puede expresar.

Hay tres formas de sumar estilos: elegir uno de la biblioteca, pedir que se
propongan según el contenido del PDF, o **pasar una referencia** — una foto de
una revista, un PDF que te gustó — para extraer sus tokens.

### Orden de resolución

```
_base.css  →  estilo elegido  →  design.md del proyecto  →  lo que pidas en el chat
```

Gana el último. Los ajustes del chat no tocan archivos; al final se te pregunta
si quieres consolidarlos.

---

## Cómo funciona por dentro

```
PDF  ──► extraer ──► entender ──► entrevista ──► voz ──► paginar ──► render ──► QA
```

Tres decisiones que vale la pena conocer:

**No editamos el PDF, lo reconstruimos.** Manipular streams de contenido y
fuentes embebidas es frágil. Extraer y rehacer desde HTML + CSS de impresión da
control total. El PDF original es materia prima, no lienzo.

**Paginamos nosotros, no el navegador.** Chrome ignora las margin boxes de CSS
paged media, así que los folios por `@page` no funcionan. Cada página es un
`div` de alto fijo que construye el plugin. A cambio sabemos en qué página cae
cada sección, que es justo lo que hace posible la tabla de contenido.

**El render es de dos pasadas.** Los números de la tabla de contenido solo se
conocen después de paginar.

---

## Limitaciones

- **PDF escaneado** sin capa de texto: necesita OCR, no incluido
- **Texto dentro de imágenes** (infografías): no se traduce, porque eso exigiría
  retocar la imagen. La traducción se pone como pie al lado
- **Imágenes de baja resolución**: el plugin nunca las agranda por encima de su
  resolución nativa; adapta la maqueta en su lugar
- **Tablas complejas**: salen, pero conviene revisarlas
- **Impresión offset**: Chrome embebe las fuentes web como Type 3. Funciona
  perfecto en pantalla y en impresión casera; para imprenta comercial conviene
  revisarlo con el proveedor

---

## Licencia

MIT
