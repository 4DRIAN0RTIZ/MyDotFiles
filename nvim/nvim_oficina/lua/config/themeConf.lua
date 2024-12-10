-- ~/.config/nvim/lua/config/themeConf.lua

local themeConf = {}

-- Configuración de colores y estilo
themeConf.setup = function()
  vim.opt.termguicolors = true
  vim.g.material_style = 'darker'
  vim.cmd('colorscheme material')
end

return themeConf
