---
name: pdf-restyle
description: Toma un PDF, lo entiende, lo traduce al espanol y lo vuelve a maquetar con un estilo visual y una voz elegidos, conservando las imagenes originales sin perdida y agregando aparato editorial (portada, tabla de contenido, folios, cornisas). Usar cuando el usuario adjunte o mencione un PDF y quiera rediseniarlo, re-maquetarlo, traducirlo, cambiarle el estilo grafico, mejorarle la diagramacion o convertirlo en una pieza editorial. Disparadores - "rediseña este PDF", "re-maqueta", "cambia el estilo de este PDF", "traduce y diagrama", "restyle", "ponle mi estilo a este PDF".
---

# PDF Restyle

Reconstruye un PDF: mismo contenido, nueva maqueta, nueva voz.

**No editamos el PDF por dentro.** Editar streams de contenido y fuentes
embebidas es frágil. Lo que hacemos es extraer, entender y **reconstruir**
desde HTML + CSS de impresión. El PDF original es materia prima, no lienzo.

`$CLAUDE_PLUGIN_ROOT` apunta a la raíz del plugin. Los estilos y voces del
usuario viven en `~/.claude/pdf-restyle/`.

---

## Paso 0 · Doctor

Siempre, antes de nada:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/doctor.sh"
```

Si falta algo, muestra la línea exacta de instalación y **para ahí**. No
intentes seguir sin poppler o sin Chrome.

En la primera corrida, copia las semillas al espacio del usuario (si no existe):

```bash
mkdir -p ~/.claude/pdf-restyle
cp -rn "$CLAUDE_PLUGIN_ROOT"/styles ~/.claude/pdf-restyle/ 2>/dev/null || true
cp -rn "$CLAUDE_PLUGIN_ROOT"/voices ~/.claude/pdf-restyle/ 2>/dev/null || true
```

Van fuera del plugin a propósito: las actualizaciones instalan en carpetas
nuevas por versión y borrarían los estilos propios del usuario.

---

## Paso 1 · Extraer

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/extract.sh" entrada.pdf work
```

Deja en `work/`: `texto.txt`, `assets/` (imágenes a resolución nativa),
`imagenes.txt` (inventario), `paginas/` (miniaturas) y `vectores/`.

**Transparencia:** `pdfimages` entrega las imágenes con alfa como dos archivos
sueltos — la imagen y su `smask`. Si se usan así, un logo sale como rectángulo
opaco. Se detecta en `imagenes.txt` (una fila `image` seguida de una `smask` con
el mismo tamaño) y se recompone:

```bash
python3 "$CLAUDE_PLUGIN_ROOT/scripts/merge_smask.py" img-000.png img-001.png logo.png
```

**Fragmentación:** si una página tiene decenas de imágenes del mismo ancho y
pocos píxeles de alto, la foto está guardada en tiras. No las extraigas:
rasteriza la región con `pdftocairo -png -r 300`.

---

## Paso 2 · Entender

Lee las miniaturas de `work/paginas/` con la herramienta Read. **Míralas de
verdad** — el texto plano no dice qué es título, qué es pie, ni qué imagen
pertenece a qué sección. La maqueta original sí.

Produce `work/content.json`:

```json
{
  "idioma_original": "en",
  "titulo": "Christmas Arrangements",
  "secciones": [
    { "id": "s1", "titulo": "Materials",
      "bloques": [
        { "tipo": "parrafo", "texto": "You will need...", "hechos": [] },
        { "tipo": "paso", "n": 3, "texto": "Cut 12 eucalyptus stems to 25 cm.",
          "hechos": ["12", "25 cm", "eucalyptus"] }
      ],
      "imagenes": [
        { "id": "img-004", "archivo": "assets/img-003-000.jpg",
          "px": [2400,1600], "ancho_max_300ppi": "203mm",
          "rol": "principal", "caption_original": "Fig. 3 — Wreath base" }
      ] }
  ]
}
```

`ancho_max_300ppi` = `px_ancho ÷ 300 × 25.4` mm, y `ancho_en_el_original` =
`px_ancho ÷ ppi_original × 25.4` mm. El segundo es el techo duro: nunca se
agranda una imagen por encima del tamaño que tenía en la fuente.

**Una página puede tener más de una imagen.** Colócalas todas: si tomas solo la
primera, pierdes ilustraciones en silencio. Y las páginas especiales —aperturas
de sección, dedicatorias— también suelen traer la suya.

En `hechos` marca todo lo inmutable: cantidades, medidas, tiempos,
temperaturas, materiales, herramientas, advertencias, marcas.

---

## Paso 3 · La entrevista

Siempre las mismas preguntas, en el mismo orden. Lee el PDF primero, así cada
una llega con una recomendación ya puesta como primera opción y aceptar todo es
dar Enter.

**El error que hay que evitar: preguntar por presets.** «Elige uno de estos
cuatro estilos» es un menú, no una pregunta de dirección. Pregunta por los
**ejes**; el preset se compone después a partir de las respuestas. Un nombre de
preset nunca es la pregunta.

### 3.0 · Antes que nada: ¿hay una referencia?

Pregunta si tiene una referencia visual — una imagen, un PDF, un link, una
publicación. **Si la hay, gana sobre todo lo demás:** extrae de ahí la paleta,
la escala tipográfica, los márgenes y el carácter, escribe un estilo nuevo en
`~/.claude/pdf-restyle/styles/` y sáltate la pantalla 1.

### Pantalla 1 · Dirección visual

Usa AskUserQuestion con **previews ASCII**: mostrar dos maquetas en texto
comunica más que cualquier adjetivo.

0. **Destino** — Celular · Impresión · Ambos. **Va primero porque determina el
   formato**, y el formato determina si el documento se puede leer. Por defecto
   es celular: es donde se termina leyendo casi todo. Ver
   `references/lectura-en-celular.md`.
1. **Carga visual** — Minimalista · Equilibrado · Maximalista
2. **Carácter gráfico** — Tech/sistemático · Manual/artesanal · Editorial
   clásico · Experimental
3. **Paleta** — Papel y tinta · Blanco y negro · Acento fuerte · Oscuro
4. **Tipografía** — Que la elijas tú · Serif · Sans · Mixta display+texto

### Pantalla 2 · Voz y formato

5. **Tono** — las voces de `~/.claude/pdf-restyle/voices/`
6. **Tratamiento** — Tú · Usted · Impersonal
7. **Intervención** — Solo traducir · Reescribir superficie · Reestructurar
8. **Formato** — se propone derivado del destino, no se pregunta en frío:
   celular → 120 × 213mm · impresión → A4 o A5 · ambos → A5

### Pantalla 3 · Aparato editorial

9. **Elementos** *(multi)* — Portada · Tabla de contenido · Folios · Cornisas ·
   Aperturas de sección · Créditos

### Los gestos: lo que separa un estilo de un tema

Un estilo que solo cambia colores y tipografía **no es un estilo, es un tema**.
Lo que distingue a uno de verdad son los gestos gráficos, y el plugin los tiene
como vocabulario compartido en `styles/_gestos.css`:

| Gesto | Clase | Qué hace |
|---|---|---|
| Tipografía fantasma | `.fantasma` | Palabra enorme al fondo, recortada por el borde, al 5–18% |
| Texto sobrepuesto | `.sobre` + `.sobre--velo` | Titular montado sobre la foto, con veladura para el contraste |
| Cifra descomunal | `.cifra` · `.cifra--trama` | El dato como imagen, con medio tono vía `background-clip: text` |
| Escala extrema | `.esc-xl` / `.esc-xs` | Los pares de contraste, mínimo 1:8 |
| Roturas de retícula | `.grid--asim` · `.grid--desfase` · `.sangre-izq` · `.col-fuera` | Salirse de la caja como gesto, no como accidente |
| Textura sin imágenes | `.trama-diag` · `.trama-puntos` · `.velo-color` | Todo con gradientes, cero archivos |
| Iconografía | `.ico` · `.ico-caja` | SVG en línea desde `assets/iconos.py`, 18 iconos en `currentColor` |
| Marca lateral | `.marca-lateral` | Cornisa rotada en el corte |

**Carga los tres en este orden:** `_base.css`, `_gestos.css`, el bloque `css` del
estilo, y por último su bloque ```gestos```, que es donde el estilo los enciende
con sus parámetros.

**La maqueta tiene que emitir los ganchos.** Si construyes páginas sin `.fantasma`
ni `.sobre` ni `.cifra`, el estilo no tiene dónde actuar y todos se ven iguales.
Lee el apartado «Gestos activos» del estilo elegido y emite lo que pide.

### Componer el estilo

Con las respuestas, busca en `styles/` el que mejor encaje. **Si ninguno cae
cerca en los cuatro ejes, escribe uno nuevo** en vez de forzar el más parecido.
Ver `references/ejes-visuales.md` para cómo cada eje se traduce en tokens.

Guarda todo en `receta.md` junto al PDF. Si la invocación trae
`--receta <archivo>`, **sáltate la entrevista completa**.

## Paso 4 · Voz

Lee `voices/_base-voz.md` (invariante) y la voz elegida. Traduce al español y
aplica el tono **en un solo paso**, sobre `content.json`.

Los cuatro niveles y el bloqueo de hechos están en `_base-voz.md`. Respétalos.

Después de reescribir, **verifica**: cada valor de `hechos` debe seguir presente
en el texto nuevo. Reporta cualquier pérdida; no la dejes pasar.

Antes de correr sobre el documento entero, muestra **una sección de muestra**
como antes/después y espera el visto bueno.

---

## Paso 5 · Paginar

Construye la maqueta a partir de `templates/base.html`, con `styles/_base.css`
más el bloque ```css``` del estilo elegido.

**Chrome ignora las margin boxes de `@page`** (verificado: `@bottom-center` con
`counter(page)` no produce nada). Por eso **paginamos nosotros**: cada página es
un `<div class="pg">` de alto fijo, y folios y cornisas van dentro.

Incluye `templates/medicion.js` al final del body y mide:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/medir.sh" work/maqueta.html
```

Devuelve, por página, cuánto se desborda, qué porcentaje de la caja va lleno y
qué imágenes quedaron bajo 150 ppi.

**No pagines a ojo: pagina con un bucle de corrección.** Cualquier estimador de
altura que escribas será aproximado, porque el alto real depende de la fuente,
del ancho de caja y de dónde caen los saltos de línea. El patrón que funciona:

```
1. Estima el alto de cada pieza y repártelas en páginas con un cupo.
2. Renderiza y mide.
3. Para cada página desbordada, fuerza un corte antes de su última pieza.
4. Vuelve al paso 1. Repite hasta que no haya desbordes (5–8 vueltas bastan).
```

Guarda qué piezas cayeron en cada página para poder corregir en la vuelta
siguiente. La medición real manda siempre sobre el estimador.

### Una página por debajo del 70% de llenado es un fallo, igual que un desborde

**El QA rechaza por las dos cosas.** Medir solo el desborde deja pasar páginas
con dos líneas de texto y doce centímetros de vacío. Si tu informe dice «cero
desbordes» y el llenado medio es 55%, el documento está mal: no lo entregues.

```
desbordes > 0        -> fallo
llenado < 0.70       -> fallo (pagina huerfana)
```

Se exceptúan portada, aperturas de capítulo, tabla de contenido y cierre: son
páginas que deben respirar. Todas las demás entran en el criterio.

### Cómo se arregla: que la imagen absorba el hueco

**Toda página de contenido lleva imagen, y la imagen crece hasta llenar la
página.** Las dos reglas son la misma: una página huérfana es una página a la
que le falta imagen.

```
1. Pagina el contenido con tu estimador.
2. Mide. Para cada pagina bajo el 70%, calcula el hueco:
       hueco_mm = (0,86 - llenado) x alto_util_mm
3. Suma ese hueco a la altura de su banda de imagen.
4. Vuelve a medir. Converge en 3 o 4 vueltas.
```

**La banda necesita `object-fit: cover` o no sirve de nada:**

```css
.banda      { width: 100%; overflow: hidden; }
.banda img  { width: 100%; height: 100%; object-fit: cover; }
```

Sin `height` y `cover`, el contenedor crece pero la imagen conserva su
proporción y deja el hueco blanco **dentro de la propia banda**. El resultado se
ve casi igual de mal que la página huérfana original, y la medición dice que
todo está bien. Verificado: solo se detecta renderizando la página y mirándola.

**Trampa del medidor:** si envuelves el contenido en un contenedor con
`height: 100%`, medir los hijos directos de `.pg` da siempre 100% y ningún
desborde. Es un falso negativo perfecto. Por eso `medicion.js` mide dentro de
`.caja` cuando existe.

**El techo de escala es el tamaño que la imagen tenía en el original**, nunca
más. Dentro de ese techo, apunta a 300 ppi y avisa por debajo de 150.

Pero si el documento entero ya viene por debajo de 150 ppi —libros escaneados,
material antiguo— **no encojas las imágenes para alcanzar ese piso**: las
dejarías más chicas que en el original y empeorarías el documento. En ese caso
el piso es informativo y el techo sigue siendo la paridad con la fuente. La
imagen manda sobre la maqueta, en los dos sentidos.

---

## Paso 6 · Aparato editorial

- **Portada** — título, subtítulo en la voz elegida, imagen principal. Sin folio.
- **Tabla de contenido** — `.toc` con `.puntos` y `.np`. Los números de página
  solo se conocen **después** de paginar: primera pasada para paginar, segunda
  para llenarla. Por eso el render es de dos pasadas.
- **Folios** — `.folio`. Nunca en portada ni en páginas a sangre.
- **Cornisas** — `.cornisa` con el nombre de la sección.
- **Créditos** — incluye por defecto la procedencia del PDF original, la fecha y
  una nota de que el texto fue traducido y re-maquetado.

---

## Paso 7 · Render y QA

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/render.sh" work/maqueta.html salida.pdf
```

Chrome **no recomprime**: el JPEG original viaja byte a byte al PDF nuevo
(verificado con MD5). Las imágenes se embeben completas sin importar a qué
tamaño se muestren, así que si el PDF sale muy pesado, reduce con `sips` a
propósito — nunca por accidente.

QA visual obligatorio:

```bash
pdftoppm -png -r 50 salida.pdf work/qa/q
```

**Si el destino es celular, además, el chequeo que de verdad importa:**

```bash
pdftoppm -png -scale-to-x 680 -scale-to-y -1 salida.pdf work/qa/celular
```

680px es el ancho real de un teléfono. Abre esas páginas y **léelas sin
ampliar**. Si tienes que acercarte, el documento no sirve: vuelve a
`references/lectura-en-celular.md` y corrige el formato, no el cuerpo.

Lee esas páginas con Read. Busca: viudas y huérfanas, títulos solos al pie,
imágenes cortadas, páginas casi vacías, folios donde no van, tabla de contenido
con números equivocados. Corrige y vuelve a renderizar.

**Mira las páginas, no solo los números.** Los dos peores fallos de este QA
—páginas huérfanas y bandas con hueco blanco dentro— pasaron la medición
numérica sin problema. Solo se ven abriendo la imagen.

Entrega el PDF, el `receta.md` y un resumen de qué se cambió respecto al
original.

---

## Límites que hay que decir de frente

- **PDF sin capa de texto.** Detectable porque `texto.txt` sale casi vacío y hay
  una imagen por página. Antes de pensar en OCR, **lee tú las páginas**: renderiza
  con `pdftoppm -r 78` y ábrelas con Read. Para un documento de hasta ~40 páginas
  es más rápido y más fiable que instalar `tesseract`, porque además entiendes la
  maqueta mientras transcribes.

  El problema real de estos PDF no es leerlos, es que **la foto y el texto vienen
  fundidos en la misma imagen**. No se pueden separar. La salida es recortar la
  zona de la foto **por CSS** —un contenedor con `overflow: hidden` y la imagen al
  100% de ancho— en lugar de reprocesar el archivo: así la imagen llega intacta al
  PDF y no se rompe la regla de no retocar. El PDF acaba conteniendo la imagen
  completa aunque solo se vea la banda; dilo en la entrega.
- **Texto dentro de imágenes** (infografías): no se traduce sin retocar la
  imagen, y no retocamos imágenes. La traducción va como caption al lado.
- **Tablas complejas**: salen, pero avisa que conviene revisarlas.
- **Imágenes de baja resolución en el original**: el techo lo pone la foto.
