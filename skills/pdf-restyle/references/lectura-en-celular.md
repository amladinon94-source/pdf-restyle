# Lectura en celular

**Casi todos estos PDF se terminan leyendo en un teléfono.** Esa es la condición
por defecto, no el caso raro. Diseñar para pantalla de computador o para papel y
esperar que «se vea bien igual» produce documentos que obligan a hacer zoom en
cada página.

## Por qué el cuerpo de texto no es el problema

Cuando abres un PDF en el celular, el visor **ajusta el ancho de página al ancho
de pantalla**. Así que el tamaño aparente del texto no depende de los puntos
solos, sino de **puntos ÷ ancho de página**.

```
aparente = cuerpo_pt × (68mm ÷ ancho_pagina_mm) × 1,33
```

68mm es el ancho útil de un celular moderno. El 1,33 compensa que el teléfono se
sostiene a unos 30cm y el papel se lee a unos 40cm.

**Objetivo: 10pt aparentes o más.** Por debajo de 8pt hay que hacer zoom.

## La tabla que decide el formato

| Formato | Ancho | Cuerpo | Aparente | |
|---|---|---|---|---|
| A4 | 210mm | 10pt | **4,3pt** | ilegible |
| A4 | 210mm | 12pt | 5,2pt | ilegible |
| A4 | 210mm | 16pt | 6,9pt | ilegible |
| A5 | 148mm | 13pt | 8,0pt | justo |
| **Vertical 9:16** | **120mm** | **13pt** | **9,8pt** | **cómodo** |

Lo importante de esta tabla: **subir el cuerpo en A4 no arregla nada.** Ni con
16pt llegas. Para que A4 funcione en celular haría falta un cuerpo de 23pt, que
impreso es absurdo y dispara el número de páginas.

**El formato de página es la palanca, no el tamaño de letra.**

### Cuerpo mínimo según el ancho de página

| Ancho | Cuerpo mínimo |
|---|---|
| 210mm (A4) | 23,2pt |
| 176mm | 19,4pt |
| 148mm (A5) | 16,3pt |
| 120mm | 13,2pt |
| 100mm | 11,0pt |

## Qué hacer

Pregunta el **destino** antes que el formato, porque lo determina:

| Destino | Formato | Cuerpo |
|---|---|---|
| **Celular** (por defecto) | 120 × 213mm (9:16) | 13–14pt |
| **Impresión** | A4 o A5 | 10–11pt |
| **Ambos** | A5 a 13pt, y avisar que en celular queda justo | 13pt |

En formato celular, además:

- **Márgenes más estrechos**: 12–14mm. Un margen de 22mm sobre 120mm se come el
  20% del ancho.
- **Línea de 38–45 caracteres.** En A4 a 10pt salen más de 80, demasiados incluso
  para papel.
- **Una columna siempre.** Dos columnas en celular obligan a subir y bajar.
- **Más páginas, y está bien.** Un documento vertical tiene el doble de páginas
  que su equivalente A4, pero se lee sin zoom. En pantalla las páginas no cuestan.

## Cómo verificarlo

No lo estimes: míralo. Renderiza la página al ancho real de un celular y léela.

```bash
pdftoppm -png -scale-to-x 680 -scale-to-y -1 salida.pdf vista-celular
```

680px son los 68mm de pantalla a 10px/mm. Abre esa imagen y léela sin ampliar.
Si tienes que acercarte, el documento no está listo.

**Este chequeo es obligatorio en el QA cuando el destino es celular.**
