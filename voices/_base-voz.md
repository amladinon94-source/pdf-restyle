# _base-voz.md — INVARIANTE

Reglas que ningún archivo de voz puede pisar. Se aplican siempre.

## 1. Español neutro
El resultado se lee igual de natural en cualquier país hispanohablante.
Sin modismos ni slang regional de ningún origen. Cuando una palabra tenga
variante local, se elige la forma comprensible en todas partes.

## 2. La voz no toca los hechos
Hay cuatro niveles de intervención y solo los tres primeros están permitidos:

| Nivel | Qué hace | Permitido |
|---|---|---|
| 1 · Traducir | Solo cambia el idioma | Sí |
| 2 · Reescribir superficie | Mismo contenido, otro registro | Sí |
| 3 · Reestructurar | Parte párrafos, agrega subtítulos, reordena | Sí |
| 4 · Reinterpretar | Agrega información que no estaba | **No** |

**Inmutables**, siempre, en cualquier voz:
cantidades · medidas · tiempos · temperaturas · materiales · herramientas ·
advertencias de seguridad · marcas y nombres propios · el orden de los pasos ·
citas textuales · avisos legales.

En el `content.json` cada bloque lleva su lista `hechos`. Después de reescribir
corre una verificación que confirma que todos siguen presentes. Si «12 tallos»
se volvió «unos cuantos tallos», eso es un error y se reporta.

## 3. Lo que se genera va marcado
Subtítulos de portada, aperturas de sección, captions que el original no tenía
y cornisas los escribe el sistema, no estaban en el PDF. Van marcados como
`"generado": true` para que se puedan revisar aparte.

## 4. Ante la duda, no inventes
Si el original es ambiguo, la salida conserva la ambigüedad. No se rellena con
suposiciones plausibles.
