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

1. El techo es el tamaño que la imagen tenía en el original; dentro de eso, se
   apunta a 300 ppi. Si el documento entero ya viene bajo 150 ppi (escaneos,
   material antiguo), no se encoge para alcanzar el piso: eso lo dejaría peor
   que la fuente.
2. Una página puede traer varias imágenes. Colócalas todas.
3. `object-fit: cover` recorta por encuadre, no reescala píxeles.
4. Una imagen a sangre no lleva folio ni cornisa encima.
5. Las verticales (`4/5`, `1/1`) piden columnas angostas; las apaisadas
   (`16/9`, `3/2`) piden ancho completo.


## Line art escaneado sobre papel de color

Los escaneos de dibujo a línea traen fondo blanco. Sobre un papel crema o
kraft, ese blanco se ve como una caja pegada encima. `.lineart`
(`mix-blend-mode: multiply`) lo disuelve y deja el trazo flotando sobre el
papel. Sobrevive al `print-to-pdf`. Solo para dibujo a línea: en fotografía
apaga las luces altas.
