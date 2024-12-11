-- codewindow.lua
require('codewindow').setup()

-- Colores personalizados para CodeWindow
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, 'CodewindowBorder', { fg = '#F3F3F3' }) -- Color blanco para el borde
vim.api.nvim_set_hl(0, 'CodewindowBackground', { bg = '#1E1E1E' }) -- Fondo oscuro
vim.api.nvim_set_hl(0, 'CodewindowWarn', { fg = '#FFA500' }) -- Color naranja para advertencias
vim.api.nvim_set_hl(0, 'CodewindowError', { fg = '#FF0000' }) -- Color rojo para errores
vim.api.nvim_set_hl(0, 'CodewindowAddition', { fg = '#00FF00' }) -- Color verde para adiciones de Git
vim.api.nvim_set_hl(0, 'CodewindowDeletion', { fg = '#FF4500' }) -- Color rojo-anaranjado para eliminaciones de Git
vim.api.nvim_set_hl(0, 'CodewindowUnderline', { fg = '#00CED1', underline = true }) -- Azul verdoso con subrayado
vim.api.nvim_set_hl(0, 'CodewindowBoundsBackground', { bg = '#2E2E2E' }) -- Fondo gris para límites visibles
