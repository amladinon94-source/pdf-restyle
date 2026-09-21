# -*- coding: utf-8 -*-
"""Iconos SVG en linea. Trazo en currentColor, sin dependencias ni fuentes
de iconos. Se insertan con ico('nombre') y heredan el color del contexto."""

_P = {
 'material':  'M3 7l9-4 9 4-9 4-9-4Z M3 12l9 4 9-4 M3 17l9 4 9-4',
 'cordon':    'M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18Z M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z '
              'M5 8c3 1 11 1 14 0 M5 16c3-1 11-1 14 0',
 'pegante':   'M9 3h6v4l2 3v11H7V10l2-3V3Z M11 13h2',
 'molde':     'M4 4h16v16H4z M4 9h16 M9 4v16 M14 9v11',
 'tijeras':   'M6 4l12 12 M18 4L6 16 M7 19a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z '
              'M17 19a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z',
 'marcador':  'M16 3l5 5-11 11-6 1 1-6L16 3Z M14 5l5 5',
 'regla':     'M2 8h20v8H2z M6 8v4 M10 8v3 M14 8v4 M18 8v3',
 'paso':      'M5 12h12 M13 7l5 5-5 5',
 'tiempo':    'M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18Z M12 7v5l3 2',
 'aviso':     'M12 3l9 17H3L12 3Z M12 10v4 M12 17h.01',
 'ok':        'M20 6L9 17l-5-5',
 'no':        'M18 6L6 18 M6 6l12 12',
 'consejo':   'M9 19h6 M10 22h4 M12 2a6.5 6.5 0 0 0-4 11.6c.6.5 1 1.3 1 2.1h6c0-.8.4-1.6 1-2.1A6.5 6.5 0 0 0 12 2Z',
 'medida':    'M3 12h18 M6 9v6 M18 9v6',
 'mano':      'M9 11V5.5a1.5 1.5 0 0 1 3 0V11 M12 11V4.5a1.5 1.5 0 0 1 3 0V11 '
              'M15 11V6.5a1.5 1.5 0 0 1 3 0V14a7 7 0 0 1-7 7h-1a6 6 0 0 1-6-6v-4a1.5 1.5 0 0 1 3 0',
 'ojo':       'M2 12s4-7 10-7 10 7 10 7-4 7-10 7-10-7-10-7Z M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z',
 'capas':     'M12 3l9 5-9 5-9-5 9-5Z M3 13l9 5 9-5',
 'flecha':    'M4 12h16 M15 7l5 5-5 5',
}

def ico(nombre, clase='ico'):
    d = _P.get(nombre)
    if not d:
        return ''
    return (f'<svg class="{clase}" viewBox="0 0 24 24" aria-hidden="true">'
            f'<path d="{d}"/></svg>')

def en_caja(nombre, clase_caja='ico-caja'):
    """El icono dentro de un circulo o cuadro, para listas de materiales."""
    return f'<span class="{clase_caja}">{ico(nombre)}</span>'

DISPONIBLES = sorted(_P)
