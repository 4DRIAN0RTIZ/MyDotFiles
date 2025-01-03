-- ~/.config/nvim/lua/config/themeConf.lua

local themeConf = {}

-- vim.opt.termguicolors = true
-- vim.cmd('colorscheme bluloco')

-- Configuración de colores y estilo
themeConf.setup = function()
  vim.opt.termguicolors = true
  -- vim.g.material_style = 'darker'
  vim.cmd('colorscheme bluloco-dark')
end

return themeConf
