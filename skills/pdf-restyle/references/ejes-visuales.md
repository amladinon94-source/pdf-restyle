# De los ejes a los tokens

Las respuestas de la entrevista no eligen un preset: **componen uno**. Esta
tabla dice cómo cada eje se traduce en valores concretos.

## Carga visual

| | Minimalista | Equilibrado | Maximalista |
|---|---|---|---|
| Elementos por página | 1 | 2–3 | 4+ |
| `--margin-v` | 28–34mm | 20–24mm | 14–18mm |
| Filetes y bordes | ninguno | uno bajo el título | retícula visible |
| Cornisas | no | sí | sí, con capítulo y número |
| Relación display/texto | 1:5 o más | 1:3 | 1:3 con marginalia |

En minimalista, ante la duda entre poner algo o no ponerlo, **no se pone**.

## Carácter gráfico

| | Tipografía | Rasgos |
|---|---|---|
| **Tech / sistemático** | sans geométrica + mono | retícula evidente, numeración monoespaciada, esquinas rectas, un acento |
| **Manual / artesanal** | serif con textura | papel cálido, filetes finos, folios entre guiones, cursivas |
| **Editorial clásico** | serif de libro | columnas justificadas, versalitas, capitulares, aperturas en impar |
| **Experimental** | display expresiva | asimetría, escala contrastada, color en bloques planos, texto en bandera |

## Paleta

| | `--bg` | `--ink` | `--accent` |
|---|---|---|---|
| Papel y tinta | crema / hueso | casi negro cálido | discreto, terroso |
| Blanco y negro | `#FFFFFF` | `#000000` | ninguno |
| Acento fuerte | neutro claro | casi negro | saturado, en bloques |
| Oscuro | profundo | claro | luminoso |

**Trucos que valen para cualquier paleta:**

- Si el documento trae imágenes con identidad propia (una portada, un logo),
  **muestrea el acento de ahí**. El color sale del material, no de tu gusto, y
  la pieza se siente de una pieza.
- Line art escaneado sobre papel de color: `.lineart` con `mix-blend-mode:
  multiply` disuelve el fondo blanco del escaneo.

## Tipografía

| | Display | Texto |
|---|---|---|
| Serif para todo | una familia, peso alto | la misma, peso normal |
| Sans para todo | una familia, peso alto | la misma, peso normal |
| Mixta | expresiva, contrastada | neutra y legible |
| Que la elijas tú | derívala del carácter gráfico y dilo en el resumen |

---

## La regla que nunca se negocia

**Ningún eje justifica tocar las imágenes.**

En particular, **nunca uses `filter` de CSS sobre una imagen del documento**
—ni `brightness`, ni `contrast`, ni `grayscale`—. Un filtro obliga a Chrome a
rasterizar y recomprimir: se pierde el original byte a byte y el PDF engorda.
Verificado: aplicar un filtro convirtió 122 imágenes idénticas en 122
recomprimidas y sumó 4 MB.

`mix-blend-mode` sí es seguro: compone sin rasterizar.

Si una imagen no encaja con la paleta, **cambia la paleta**, no la imagen.
