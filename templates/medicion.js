/* Se inyecta al final de la maqueta. Reporta desbordes por pagina. */
(function () {
  var out = [];
  document.querySelectorAll('.pg').forEach(function (pg, i) {
    var cs = getComputedStyle(pg);
    var util = pg.clientHeight - parseFloat(cs.paddingTop) - parseFloat(cs.paddingBottom);
    var usado = 0, desborde = [];
    pg.querySelectorAll(':scope > *:not(.folio):not(.cornisa)').forEach(function (el) {
      usado += el.getBoundingClientRect().height;
    });
    if (usado > util + 1) {
      desborde.push({ sobra_px: Math.round(usado - util), sobra_mm: +((usado - util) / 3.7795).toFixed(1) });
    }
    // imagenes por debajo de 150 ppi al tamano en que se muestran
    var flojas = [];
    pg.querySelectorAll('img').forEach(function (im) {
      var anchoMm = im.getBoundingClientRect().width / 3.7795;
      var ppi = im.naturalWidth / (anchoMm / 25.4);
      if (im.naturalWidth && ppi < 150) flojas.push({ src: im.getAttribute('src'), ppi: Math.round(ppi) });
    });
    out.push({ pagina: i + 1, alto_util_px: Math.round(util), usado_px: Math.round(usado),
               desborde: desborde, imagenes_bajo_150ppi: flojas });
  });
  var s = document.createElement('script');
  s.id = 'medicion'; s.type = 'application/json';
  s.textContent = JSON.stringify({ paginas: out });
  document.body.appendChild(s);
})();
