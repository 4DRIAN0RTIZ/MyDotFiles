require('bufferline').setup {
  options = {
    numbers = "ordinal",
    number_style = "",
    mappings = true,
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = "▎",
      style = "icon",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      }
    },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "id",
    highlights = {
      fill = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "Normal" }
      },
      background = {
        guifg = { attribute = "bg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "Normal" }
      },
      buffer_selected = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "Normal" },
        gui = "bold"
      }
    }
  }
}

-- Cambiar entre buffers con números ordinales (Alt + Número)
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<A-'..i..'>', ':BufferLineGoToBuffer '..i..'<CR>', { noremap = true, silent = true })
end
