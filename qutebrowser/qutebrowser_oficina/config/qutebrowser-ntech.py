neandertech_theme = {
    # Base colors with variations
    'base_dark': '#222222',    # Principal dark background
    'dark_alt1': '#2a2a2a',    # Slightly lighter dark
    'dark_alt2': '#333333',    # Medium dark tone
    'primary_orange': '#e38526',  # Principal orange
    'accent_orange': '#ff9e3b',   # Bright orange for highlights
    'soft_orange': '#ffbe63',     # Soft orange for accents
    'light_orange': '#ffaa33',    # Lighter orange
    # Additional accents
    'vibrant_accent': '#ff6e26',  # Vibrant orange accent
    'bright_accent': '#ff9236',   # Bright secondary accent
    'neutral_dark': '#444444',    # Neutral soft dark
    'neutral_gray': '#666666',    # Neutral medium tone
    # Warnings and status colors
    'error_red': '#e34040',       # Strong red for errors
    'warning_orange': '#e38526',  # Main orange for warnings
    'alert_yellow': '#ffee00',    # Bright yellow for alerts
    'status_cyan': '#00cccc',     # Neon cyan for status
    'emphasis_red': '#ff4500',    # Strong red for emphasis
}

# Configuración del tema para qutebrowser utilizando los colores definidos
c.colors.completion.category.bg = neandertech_theme['base_dark']
c.colors.completion.category.border.bottom = neandertech_theme['dark_alt1']
c.colors.completion.category.border.top = neandertech_theme['dark_alt1']
c.colors.completion.category.fg = neandertech_theme['soft_orange']
c.colors.completion.even.bg = neandertech_theme['base_dark']
c.colors.completion.odd.bg = neandertech_theme['dark_alt1']
c.colors.completion.fg = neandertech_theme['accent_orange']
c.colors.completion.item.selected.bg = neandertech_theme['primary_orange']
c.colors.completion.item.selected.border.bottom = neandertech_theme['primary_orange']
c.colors.completion.item.selected.border.top = neandertech_theme['primary_orange']
c.colors.completion.item.selected.fg = neandertech_theme['light_orange']
c.colors.completion.match.fg = neandertech_theme['alert_yellow']
c.colors.completion.scrollbar.bg = neandertech_theme['dark_alt1']
c.colors.completion.scrollbar.fg = neandertech_theme['soft_orange']
c.colors.downloads.bar.bg = neandertech_theme['base_dark']
c.colors.downloads.error.bg = neandertech_theme['error_red']
c.colors.downloads.error.fg = neandertech_theme['soft_orange']
c.colors.downloads.stop.bg = neandertech_theme['emphasis_red']
c.colors.downloads.system.bg = 'none'
c.colors.hints.bg = neandertech_theme['alert_yellow']
c.colors.hints.fg = neandertech_theme['base_dark']
c.colors.hints.match.fg = neandertech_theme['neutral_gray']
c.colors.keyhint.bg = neandertech_theme['dark_alt1']
c.colors.keyhint.fg = neandertech_theme['soft_orange']
c.colors.keyhint.suffix.fg = neandertech_theme['alert_yellow']
c.colors.messages.error.bg = neandertech_theme['error_red']
c.colors.messages.error.border = neandertech_theme['error_red']
c.colors.messages.error.fg = neandertech_theme['soft_orange']
c.colors.messages.info.bg = neandertech_theme['neutral_dark']
c.colors.messages.info.border = neandertech_theme['neutral_dark']
c.colors.messages.info.fg = neandertech_theme['soft_orange']
c.colors.messages.warning.bg = neandertech_theme['warning_orange']
c.colors.messages.warning.border = neandertech_theme['warning_orange']
c.colors.messages.warning.fg = neandertech_theme['soft_orange']
c.colors.prompts.bg = neandertech_theme['dark_alt2']
c.colors.prompts.border = '1px solid ' + neandertech_theme['base_dark']
c.colors.prompts.fg = neandertech_theme['soft_orange']
c.colors.prompts.selected.bg = neandertech_theme['primary_orange']
c.colors.statusbar.caret.bg = neandertech_theme['emphasis_red']
c.colors.statusbar.caret.fg = neandertech_theme['soft_orange']
c.colors.statusbar.caret.selection.bg = neandertech_theme['emphasis_red']
c.colors.statusbar.caret.selection.fg = neandertech_theme['soft_orange']
c.colors.statusbar.command.bg = neandertech_theme['dark_alt2']
c.colors.statusbar.command.fg = neandertech_theme['soft_orange']
c.colors.statusbar.command.private.bg = neandertech_theme['dark_alt2']
c.colors.statusbar.command.private.fg = neandertech_theme['soft_orange']
c.colors.statusbar.insert.bg = neandertech_theme['status_cyan']
c.colors.statusbar.insert.fg = neandertech_theme['dark_alt1']
c.colors.statusbar.normal.bg = neandertech_theme['base_dark']
c.colors.statusbar.normal.fg = neandertech_theme['soft_orange']
c.colors.statusbar.passthrough.bg = neandertech_theme['neutral_gray']
c.colors.statusbar.passthrough.fg = neandertech_theme['soft_orange']
c.colors.statusbar.private.bg = neandertech_theme['primary_orange']
c.colors.statusbar.private.fg = neandertech_theme['soft_orange']
c.colors.statusbar.progress.bg = neandertech_theme['soft_orange']
c.colors.statusbar.url.error.fg = neandertech_theme['error_red']
c.colors.statusbar.url.fg = neandertech_theme['soft_orange']
c.colors.statusbar.url.hover.fg = neandertech_theme['neutral_dark']
c.colors.statusbar.url.success.http.fg = neandertech_theme['soft_orange']
c.colors.statusbar.url.success.https.fg = neandertech_theme['status_cyan']
c.colors.statusbar.url.warn.fg = neandertech_theme['warning_orange']
c.colors.tabs.bar.bg = neandertech_theme['primary_orange']
c.colors.tabs.even.bg = neandertech_theme['primary_orange']
c.colors.tabs.even.fg = neandertech_theme['base_dark']
c.colors.tabs.indicator.error = neandertech_theme['error_red']
c.colors.tabs.odd.bg = neandertech_theme['primary_orange']
c.colors.tabs.odd.fg = neandertech_theme['base_dark']
c.colors.tabs.selected.even.bg = neandertech_theme['base_dark']
c.colors.tabs.selected.even.fg = neandertech_theme['soft_orange']
c.colors.tabs.selected.odd.bg = neandertech_theme['base_dark']
c.colors.tabs.selected.odd.fg = neandertech_theme['soft_orange']
c.colors.webpage.bg = 'black'

