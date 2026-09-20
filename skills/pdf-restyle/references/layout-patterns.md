# Patrones de página

Bloques de maqueta reutilizables. Todos van dentro de un `.pg`.

## Portada
`.pg.pg--portada.pg--sangre` con `<img class="sangre">` y el título
sobreimpreso. Sin folio ni cornisa.

## Apertura de sección
Página con mucho aire: solo el número y el título de la sección, arriba o al
centro. En estilos editoriales, siempre en página impar.

## Texto + imagen
```html
<div class="grid">
  <div style="grid-column: span 7"> ...texto... </div>
  <figure class="fig" style="grid-column: span 5"> <img src=""><figcaption></figcaption> </figure>
</div>
```

## Pasos
`<ol class="pasos">` numera solo con contador CSS. Un paso por `<li>`, con su
imagen dentro si la tiene. En `manual-claro`, máximo cuatro por página.

## Galería
Grilla de 2 o 3 columnas con `.fig` y `--img-ratio` uniforme. Sirve para
material, variantes o resultados.

## Aviso
`.aviso` para advertencias de seguridad. Va **antes** del paso que lo necesita,
nunca después.

## Cierre / créditos
Procedencia del PDF original, fecha, nota de traducción y re-maquetación.

---

## Reglas de imagen

1. Nunca escalar por encima de `ancho_max_300ppi`. Bajo 150 ppi, se achica el
   hueco — no se agranda la foto.
2. `object-fit: cover` recorta por encuadre, no reescala píxeles.
3. Una imagen a sangre no lleva folio ni cornisa encima.
4. Las verticales (`4/5`, `1/1`) piden columnas angostas; las apaisadas
   (`16/9`, `3/2`) piden ancho completo.
