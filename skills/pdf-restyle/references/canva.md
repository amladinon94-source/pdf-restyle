# Canva como fuente de imágenes y estilo

El conector de Canva (**Canva AI Connector**, el que aparece como
`mcp__*_Canva__*`) sirve para sacar diseños y assets de la cuenta del usuario y
meterlos en la maqueta. Todo lo de aquí está verificado contra una cuenta real.

**No confundir con estas dos, que no sirven para esto:**

| | Para qué es | ¿Sirve? |
|---|---|---|
| **Canva CLI** (`@canva/cli`) | Crear y desarrollar Canva Apps | No. Su documentación dice explícitamente que no exporta diseños ni descarga assets |
| **Canva Dev MCP** | Dar documentación del Apps SDK a un agente que programa | No. Es herramienta de desarrollo |
| **Canva AI Connector** | Diseños, assets, brand kits del usuario | **Sí** |

## El flujo que funciona

```
search-designs          encontrar el diseño
get-export-formats      SIEMPRE antes de exportar; no adivines el formato
export-design           devuelve una URL de descarga temporal
curl                    bajarla
```

### Generar imágenes nuevas

```
generate-design         devuelve 4 candidatos
create-design-from-candidate    convierte uno en diseño editable
read-design (open_transaction)  estructura completa con locator_id por elemento
edit-design             operaciones sobre elementos concretos
edit-design finalize=commit     guardar (irreversible)
export-design           sacarlo
```

`edit-design` da control real: `add_text`, `format_text`, `position_element`,
`resize_element`, `insert_shape` con paths SVG, `update_fill`, `delete_element`.

**Cuenta con corregir lo que genera su IA.** En la prueba real partió un título
en dos elementos con colores distintos y metió el subtítulo en una caja de 109px
encimada sobre el título. Hicieron falta 7 operaciones para dejarlo presentable.

### Banco de fotografías en un solo diseño

Generar imagen por imagen cuesta 4 llamadas cada una. Sale mucho mejor:

1. `generate-design` de tipo `presentation` pidiendo N diapositivas, **una
   fotografía por diapositiva** y sin texto.
2. `export-design` a PNG: devuelve una URL por página.
3. Recortar el rectángulo de la foto de cada diapositiva, que está siempre en la
   misma posición: `sips --cropOffset <y> <x> -c <alto> <ancho>`.

Recortar estas imágenes **sí es legítimo**: son assets que generamos nosotros. La
regla de no retocar protege las imágenes del documento original, no estas.

## Tres límites que hay que saber

**No se pueden subir archivos locales.** `upload-asset-from-url` solo acepta URLs
ya públicas. La dirección *Canva → local* funciona; *local → Canva* no, salvo que
el usuario suba el archivo a mano. Nunca publiques sus archivos en un hosting
público para sortearlo.

**El brand kit no expone colores ni tipografías.** `list-brand-kits` devuelve id y
miniatura, nada más. Para la paleta de marca: muestrea la miniatura, o exporta un
diseño donde ya la esté usando, o pide los hex una vez y guárdalos como estilo.

**El tamaño de página no se respeta.** Pidiendo `size: a4` salió A2, y las
imágenes bajan a 1024px en el export.

## Cómo integrarlo sin romper el formato

**No unas dos PDF con `pdfunite`**: el documento queda con tamaños de página
mezclados. En su lugar, exporta a PNG en la proporción correcta y **mete la
imagen dentro de la maqueta**:

```
export-design PNG width=2480   ->  A4 exacto a 300 ppi (2480 × 3507)
```

Así sale un solo PDF con un solo tamaño de página, y la imagen llega intacta.

## Muestrear la paleta de un diseño

Mismo mecanismo que con cualquier otra imagen: bajar el export, reducir con
`sips` y contar colores dominantes clasificándolos por luminosidad y saturación
en fondo / tinta / acento. Con eso se genera un archivo de estilo nuevo.
