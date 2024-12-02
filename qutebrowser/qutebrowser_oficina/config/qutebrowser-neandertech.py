gray_orange = {
    # Gray tones
    'gray0': '#222222',  # Dark gray background
    'gray1': '#333333',  # Slightly lighter gray
    'gray2': '#444444',  # Even lighter gray
    'gray3': '#555555',  # Light gray
    'gray4': '#666666',  # Very light gray
    'gray5': '#777777',  # Light gray for text
    'gray6': '#888888',  # Gray for text
    'gray7': '#999999',  # Dark gray for text
    'gray8': '#aaaaaa',  # Very dark gray for text
    'gray9': '#bbbbbb',  # Dark gray for text

    # Orange tones
    'orange0': '#e38528',  # Base orange
    'orange1': '#d47518',  # Slightly darker orange
    'orange2': '#f29538',  # Slightly lighter orange
    'orange3': '#c56508',  # Dark orange
    'orange4': '#f2a548',  # Light orange
}

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = gray_orange['gray0']

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = gray_orange['gray0']

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = gray_orange['gray0']

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = gray_orange['orange0']

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = gray_orange['gray1']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = gray_orange['gray1']

# Text color of the completion widget.
# Type: QtColor
c.colors.completion.fg = gray_orange['gray8']

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = gray_orange['gray2']

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = gray_orange['gray2']

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = gray_orange['gray2']

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = gray_orange['gray8']

# Foreground color of the matched text in the completion.
# Type: QssColor
c.colors.completion.match.fg = gray_orange['orange2']

# Color of the scrollbar in completion view
# Type: QssColor
c.colors.completion.scrollbar.bg = gray_orange['gray1']

# Color of the scrollbar handle in completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = gray_orange['orange0']

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = gray_orange['gray0']

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = gray_orange['orange3']

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = gray_orange['gray8']

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = gray_orange['orange4']

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
c.colors.hints.bg = gray_orange['orange0']

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = gray_orange['gray0']

# Font color for the matched part of hints.
# Type: QssColor
c.colors.hints.match.fg = gray_orange['gray8']

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = gray_orange['gray1']

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = gray_orange['gray8']

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = gray_orange['orange2']

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = gray_orange['orange3']

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = gray_orange['orange3']

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = gray_orange['gray8']

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = gray_orange['gray2']

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = gray_orange['gray2']

# Foreground color an info message.
# Type: QssColor
c.colors.messages.info.fg = gray_orange['gray8']

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = gray_orange['orange1']

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = gray_orange['orange1']

# Foreground color a warning message.
# Type: QssColor
c.colors.messages.warning.fg = gray_orange['gray8']

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = gray_orange['gray2']

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = '1px solid ' + gray_orange['gray0']

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = gray_orange['gray8']

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = gray_orange['gray3']

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = gray_orange['orange4']

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = gray_orange['gray0']

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = gray_orange['orange4']

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = gray_orange['gray0']

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = gray_orange['gray2']

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = gray_orange['gray8']

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = gray_orange['gray2']

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = gray_orange['gray8']

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = gray_orange['orange0']

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = gray_orange['gray0']

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = gray_orange['gray0']

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = gray_orange['gray8']

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = gray_orange['gray3']

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = gray_orange['gray8']

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = gray_orange['gray3']

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = gray_orange['gray8']

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = gray_orange['orange0']

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = gray_orange['orange3']

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = gray_orange['gray8']

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = gray_orange['gray3']

# Foreground color of the URL in the statusbar on successful load (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = gray_orange['gray8']

# Foreground color of the URL in the statusbar on successful load (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = gray_orange['orange0']

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = gray_orange['orange1']

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = gray_orange['gray3']

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = gray_orange['gray3']

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = gray_orange['gray8']

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = gray_orange['orange3']

# Color gradient start for the tab indicator.
# Type: QtColor
# c.colors.tabs.indicator.start = gray_orange['orange0']

# Color gradient end for the tab indicator.
# Type: QtColor
# c.colors.tabs.indicator.stop = gray_orange['orange2']

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
c.colors.tabs.odd.bg = gray_orange['gray3']

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = gray_orange['gray8']

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = gray_orange['gray0']

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = gray_orange['gray8']

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = gray_orange['gray0']

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = gray_orange['gray8']

# Background color for webpages if unset (or empty to use the theme's color)
# Type: QtColor
c.colors.webpage.bg = 'black'