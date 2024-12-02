gruvbox = {
    # Gruvbox dark colors
    'bg0': '#282828',  # Dark background
    'bg1': '#3c3836',  # Slightly lighter background
    'bg2': '#504945',  # Even lighter background
    'bg3': '#665c54',  # Light background
    'bg4': '#7c6f64',  # Very light background
    'fg0': '#fbf1c7',  # Light foreground
    'fg1': '#ebdbb2',  # Slightly darker foreground
    'fg2': '#d5c4a1',  # Even darker foreground
    'fg3': '#bdae93',  # Dark foreground
    'fg4': '#a89984',  # Very dark foreground
    'red': '#cc241d',  # Red
    'green': '#98971a',  # Green
    'yellow': '#d79921',  # Yellow
    'blue': '#458588',  # Blue
    'purple': '#b16286',  # Purple
    'aqua': '#689d6a',  # Aqua
    'gray': '#928374',  # Gray
    'orange': '#d65d0e',  # Orange
}

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = gruvbox['bg0']

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = gruvbox['bg0']

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = gruvbox['bg0']

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = gruvbox['fg0']

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = gruvbox['bg1']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = gruvbox['bg1']

# Text color of the completion widget.
# Type: QtColor
c.colors.completion.fg = gruvbox['fg0']

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = gruvbox['bg2']

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = gruvbox['bg2']

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = gruvbox['bg2']

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = gruvbox['fg0']

# Foreground color of the matched text in the completion.
# Type: QssColor
c.colors.completion.match.fg = gruvbox['yellow']

# Color of the scrollbar in completion view
# Type: QssColor
c.colors.completion.scrollbar.bg = gruvbox['bg1']

# Color of the scrollbar handle in completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = gruvbox['fg0']

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = gruvbox['bg0']

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = gruvbox['red']

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = gruvbox['fg0']

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = gruvbox['yellow']

# Color gradient interpolation system for download backgrounds.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.bg = 'none'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = gruvbox['yellow']

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = gruvbox['bg0']

# Font color for the matched part of hints.
# Type: QssColor
c.colors.hints.match.fg = gruvbox['green']

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = gruvbox['bg1']

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = gruvbox['fg0']

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = gruvbox['yellow']

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = gruvbox['red']

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = gruvbox['red']

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = gruvbox['fg0']

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = gruvbox['bg2']

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = gruvbox['bg2']

# Foreground color an info message.
# Type: QssColor
c.colors.messages.info.fg = gruvbox['fg0']

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = gruvbox['orange']

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = gruvbox['orange']

# Foreground color a warning message.
# Type: QssColor
c.colors.messages.warning.fg = gruvbox['fg0']

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = gruvbox['bg2']

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = '1px solid ' + gruvbox['bg0']

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = gruvbox['fg0']

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = gruvbox['bg3']

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = gruvbox['yellow']

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = gruvbox['fg0']

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = gruvbox['yellow']

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = gruvbox['fg0']

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = gruvbox['bg2']

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = gruvbox['fg0']

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = gruvbox['bg2']

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = gruvbox['fg0']

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = gruvbox['green']

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = gruvbox['bg0']

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = gruvbox['bg0']

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = gruvbox['fg0']

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = gruvbox['blue']

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = gruvbox['fg0']

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = gruvbox['bg3']

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = gruvbox['fg0']

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = gruvbox['green']

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = gruvbox['red']

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = gruvbox['fg0']

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = gruvbox['blue']

# Foreground color of the URL in the statusbar on successful load (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = gruvbox['fg0']

# Foreground color of the URL in the statusbar on successful load (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = gruvbox['green']

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = gruvbox['orange']

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = gruvbox['bg3']

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = gruvbox['bg3']

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = gruvbox['fg0']

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = gruvbox['red']

# Color gradient start for the tab indicator.
# Type: QtColor
# c.colors.tabs.indicator.start = gruvbox['purple']

# Color gradient end for the tab indicator.
# Type: QtColor
# c.colors.tabs.indicator.stop = gruvbox['orange']

# Color gradient interpolation system for the tab indicator.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'none'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = gruvbox['bg3']

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = gruvbox['fg0']

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = gruvbox['bg0']

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = gruvbox['fg0']

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = gruvbox['bg0']

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = gruvbox['fg0']

# Background color for webpages if unset (or empty to use the theme's color)
# Type: QtColor
c.colors.webpage.bg = 'black'