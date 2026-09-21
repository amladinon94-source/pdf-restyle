# Manifiesto serif

**Referencia:** cartelería de consultoría sobre fondo greige, con serif grande en
marrón oscuro y una barra de resaltador bajo las palabras clave.
**Cuándo usarlo:** documentos con una tesis que defender — manifiestos,
posicionamientos, ensayos, propuestas estratégicas. Cuando la frase importa más
que el dato.
**Sensación:** autoridad tranquila. Se lee como algo pensado, no como algo vendido.
**Voz sugerida:** editorial

```css
:root {
  --page: A4; --page-w: 210mm; --page-h: 297mm;
  --margin-v: 22mm; --margin-h: 20mm;
  --cols: 12; --gutter: 6mm;

  --font-display: 'Petrona', Georgia, serif;
  --font-text: 'Inter', -apple-system, system-ui, sans-serif;
  --size-body: 9.5pt; --leading: 1.6;
  --size-h1: 40pt; --size-h2: 16pt; --size-h3: 10pt;

  --bg: #DEDCCE; --ink: #481800; --accent: #C03024; --muted: #8C7A66;
  --resalte: #E8564A;
  --parrafo-gap: 4mm;
}
```

```fonts
https://fonts.googleapis.com/css2?family=Petrona:ital,wght@0,400;0,500;1,400&family=Inter:wght@400;600;700&display=swap
```

## Cómo se comporta

- **La frase es el diseño.** Un enunciado largo en serif a 40pt ocupa la mayor
  parte de la página. Interlínea 1,12, sin tracking negativo: la serif necesita
  su aire.
- **El resaltador es la firma.** Un bloque coral detrás de dos o tres palabras,
  con 1mm de holgura arriba y abajo. **Una sola vez por página**, sobre lo que de
  verdad decide la frase.
- **Contraste de familias**: serif para el enunciado, sans para todo lo demás
  —etiquetas, cuerpo, pies—. Nunca sans en el enunciado ni serif en el cuerpo.
- **Micro-etiquetas con viñeta cuadrada** (■) en la cabecera, a 8pt, en dos o
  tres bloques cortos alineados arriba a la derecha.
- **Banda de proceso al pie**: fondo marrón oscuro, y dentro una secuencia de
  palabras unidas por flechas largas — `CAMBIAR ⟶ DESARROLLAR ⟶ MOVER`. Ancla la
  pieza y da continuidad entre páginas.
- Fondo greige, nunca blanco. El blanco rompe la calidez del marrón.

## Gestos activos

`res` como barra de resaltador, una vez por página · viñetas cuadradas con icono ·
banda de proceso al pie con flechas · escala serif 1:5.

```gestos
:root { --esc-xl: 40pt; --esc-l: 20pt; --esc-xs: 8pt; --ico: 4mm;
        --fantasma-op: .06; --fantasma-size: 140pt; --fantasma-color: var(--ink); }
.enunciado { font-family: var(--font-display); font-weight: 400; font-size: 40pt;
             line-height: 1.12; letter-spacing: 0; color: var(--ink); margin: 0 0 8mm; }
.res { background: var(--resalte); padding: 0 1.5mm 1mm;
       box-decoration-break: clone; -webkit-box-decoration-break: clone; }
.etiquetas { display: flex; gap: 7mm; justify-content: flex-end; margin-bottom: 9mm; }
.cuad { display: flex; align-items: flex-start; gap: 2mm; font-family: var(--font-text);
        font-weight: 700; font-size: 7.5pt; line-height: 1.3; letter-spacing: .1em;
        text-transform: uppercase; color: var(--accent); max-width: 34mm; }
.cuad::before { content: '■'; font-size: 6pt; line-height: 1.6; }
.proc { position: absolute; bottom: 0; left: 0; right: 0; background: var(--ink);
        padding: 4mm var(--margin-h); display: flex; align-items: center; gap: 3mm;
        font-family: var(--font-text); font-size: 7.5pt; font-weight: 700;
        letter-spacing: .14em; text-transform: uppercase; color: var(--bg); }
.proc .ico { width: 5mm; height: 5mm; opacity: .8; }
.proc i { flex: 1; height: .5pt; background: var(--bg); opacity: .45; }
```

## Límites
Con 40pt de enunciado, en celular se lee cómodo sin tocar nada. El cuerpo a
9,5pt no: si hay texto largo, pásalo a la variante celular.
