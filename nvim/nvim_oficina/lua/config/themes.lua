-- ~/.config/nvim/lua/config/themes.lua

local themeConf = require('config.themeConf')
themeConf.setup()

local default_colors = { fg = '#FFFFFF', bold = true }

local colorschemes = {
  synthweave = {
    LineNrAbove = { fg = '#F222FF', bold = true },
    LineNrBelow = { fg = '#F222FF', bold = true },
  },
  material = {
    LineNrAbove = { fg = '#FF5370', bold = true },
    LineNrBelow = { fg = '#FF5370', bold = true },
  },
  gruvbox = {
    LineNrAbove = { fg = '#FABD2F', bold = true },
    LineNrBelow = { fg = '#FABD2F', bold = true },
  },
  dracula = {
    LineNrAbove = { fg = '#BD93F9', bold = true },
    LineNrBelow = { fg = '#BD93F9', bold = true },
  }
}

local function applyNumberColors()
  local current_colorscheme = vim.api.nvim_exec('colorscheme', true)
  local colors = colorschemes[current_colorscheme] or {
    LineNrAbove = default_colors,
    LineNrBelow = default_colors,
  }

  for group, opts in pairs(colors) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

applyNumberColors()

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = applyNumberColors,
})
