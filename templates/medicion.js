/* Se inyecta al final de la maqueta. Reporta desbordes y llenado por pagina.
   OJO: mide dentro de .caja si existe. Un contenedor con height:100% siempre
   mide 100% del alto util, asi que medir los hijos directos de .pg da un falso
   negativo perfecto: cero desbordes en todas las paginas. Verificado. */
(function () {
  var out = [];
  document.querySelectorAll('.pg').forEach(function (pg, i) {
    var caja = pg.querySelector('.caja') || pg;
    var usado = 0;
    Array.prototype.forEach.call(caja.children, function (el) {
      if (el.classList.contains('folio') || el.classList.contains('cornisa')) return;
      var r = el.getBoundingClientRect(), cs = getComputedStyle(el);
      usado += r.height + parseFloat(cs.marginTop || 0) + parseFloat(cs.marginBottom || 0);
    });
    var cs = getComputedStyle(pg);
    var util = pg.clientHeight - parseFloat(cs.paddingTop) - parseFloat(cs.paddingBottom);
    var desborde = [];
    if (usado > util + 2) {
      desborde.push({ sobra_px: Math.round(usado - util),
                      sobra_mm: +((usado - util) / 3.7795).toFixed(1) });
    }
    var flojas = [];
    pg.querySelectorAll('img').forEach(function (im) {
      var anchoMm = im.getBoundingClientRect().width / 3.7795;
      var ppi = im.naturalWidth / (anchoMm / 25.4);
      if (im.naturalWidth && ppi < 150) flojas.push({ src: im.getAttribute('src'), ppi: Math.round(ppi) });
    });
    out.push({ pagina: i + 1, alto_util_px: Math.round(util), usado_px: Math.round(usado),
               llenado: +(usado / util).toFixed(2), desborde: desborde,
               imagenes_bajo_150ppi: flojas });
  });
  var s = document.createElement('script');
  s.id = 'medicion'; s.type = 'application/json';
  s.textContent = JSON.stringify({ paginas: out });
  document.body.appendChild(s);
})();
