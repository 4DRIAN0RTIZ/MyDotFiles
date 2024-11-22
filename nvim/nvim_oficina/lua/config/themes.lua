-- ~/.config/nvim/lua/config/themes.lua

vim.opt.termguicolors = true
command = 'colorscheme gruvbox'
vim.cmd(command)

function lineNumberColors()
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#F222FF', bold = true })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#F222FF', bold = true })
end

if command == 'colorscheme synthweave' then
  lineNumberColors()
end
