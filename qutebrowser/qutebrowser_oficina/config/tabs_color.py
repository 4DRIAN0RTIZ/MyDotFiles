def set_tab_colors(config, url):
    """
    Cambia los colores de las pestañas según la URL.
    """
    if 'neanderpruebas.com/erp-productivo/' in url:
        bg_color = '#ff0000'
        fg_color = '#ffffff'
    elif 'otro-dominio.com' in url:
        bg_color = '#0000ff'
        fg_color = '#ffffff'
    else:
        # Colores predeterminados
        bg_color = '#444444'
        fg_color = '#ffffff'

    config.set('colors.tabs.selected.odd.bg', bg_color)
    config.set('colors.tabs.selected.even.bg', bg_color)
    config.set('colors.tabs.selected.odd.fg', fg_color)
    config.set('colors.tabs.selected.even.fg', fg_color)

