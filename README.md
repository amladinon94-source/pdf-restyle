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

## Se lee en el celular

Casi todos estos PDF se terminan leyendo en un teléfono, así que el plugin
pregunta el **destino** antes que nada y de ahí deriva el formato.

El dato que lo decide: en el celular el visor ajusta el ancho de página al de
pantalla, así que el tamaño aparente del texto es `cuerpo ÷ ancho de página`.

| Formato | Cuerpo | Se ve como | |
|---|---|---|---|
| A4 | 10pt | 4,3pt | ilegible |
| A4 | 16pt | 6,9pt | ilegible |
| Vertical 120mm | 13pt | 9,8pt | cómodo |

**Subir el tamaño de letra en A4 no arregla nada.** Haría falta un cuerpo de
23pt. El formato de página es la palanca. Por eso cada estilo tiene su variante
`-celular` en vertical 9:16.

## Estilos y voces

En la primera corrida se copian a `~/.claude/pdf-restyle/`. Viven fuera del
plugin a propósito: las actualizaciones no te los borran.

**Estilos editoriales** — ocho direcciones con carácter propio:

| | Qué hace |
|---|---|
| `dato-gigante` | Campo de color plano y una cifra descomunal con trama de medio tono |
| `rojo-condensado` | Rojo a sangre, titular condensado apilado, numeral fantasma gigante |
| `panel-modular` | Bento de módulos redondeados, monoespaciada en los metadatos |
| `hueso-naranja` | Fondo crema, un solo naranja, fotografía en bloques netos |
| `manifiesto-serif` | Serif grande sobre greige, con barra de resaltador en lo que importa |
| `acido` | Negro y amarillo, titular cortado a media palabra, nativo de vertical |
| `mosaico` | Blanco y negro, palabra gigante y retícula apretada de fotos |
| `deck-rojo` | Hueso y un rojo, logotipo ancla repetido, apaisado |

Doce de los quince tienen variante `-celular` en vertical 9:16, con el cuerpo a
13pt y los ajustes propios de cada uno. `acido` no la necesita —ya nació
vertical— y `deck-rojo` es apaisado por definición.

**Estilos de manual** — `editorial-calido` · `nordico-minimal` ·
`artesanal-vintage` · `manual-claro` · `moderno-limpio` · `manual-experimental` ·
`minimal-experimental`
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

## Canva

Si tienes el conector de Canva conectado, el plugin puede sacar de ahí la
fotografía que el PDF original no tiene, y muestrearle la paleta a un diseño tuyo
para generar un estilo nuevo.

Lo que **no** sirve para esto, aunque lo parezca: el Canva CLI y el Canva Dev
MCP. Los dos son para construir apps de Canva, no para sacar contenido.

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
