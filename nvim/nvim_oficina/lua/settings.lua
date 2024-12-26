-- ~/.config/nvim/lua/config/settings.lua

-- Load plugins
require('plugins')

-- Load plugin configurations
require('config.aerial')
require('config.binary_clock')
require('config.bufferline')
require('config.chatgpt')
require('config.codewindow')
require('config.colorizer')
require('config.copilot')
require('config.copilot_chat')
require('config.dap')
require('config.diffview')
require('config.gitsigns')
require('config.indentline')
require('config.lsp')
require('config.lualine')
require('config.mason')
require('config.neoscroll')
require('config.noice')
require('config.notify')
require('config.nvim_tree')
require('config.smear_cursor')
require('config.telescope')
require('config.themes')
require('config.toggleterm')
require('config.trouble')
require('config.whichkey')
require('config.websearcher')
-- Owns Plugins
require('config.envolver')
require('config.pomodoro')
require('config.ticket_notes')
require('config.ticket_playground')
-- Load keymaps
require('cocconfig')
require('keymaps')

-- Unused plugins
-- require('abbrev')
-- require('config.como_hoy')
-- require('config.cyberdream')
-- require('config.dadbod')
-- require('config.navic')
-- require('config.sqls')
-- require('config.todo_comments')

-- local viewer = require('config.photo_show')

-- -- Configuración inicial
-- viewer.setup({
--   term_width = 0.22, -- 40% del ancho
--   term_height = 0.2, -- 40% de la altura
--   timg_size = "20x10", -- Tamaño en timg
--   position = "top_right", -- Ventana centrada
--   fixed_image = "/home/neandertech/space.gif", -- Imagen fija
-- })

-- -- Keymap para mostrar siempre la misma imagen fija
-- vim.api.nvim_set_keymap(
--   'n',
--   '<Leader>vi',
--   [[<Cmd>lua require('config.photo_show').show_fixed_image()<CR>]],
--   { noremap = true, silent = true }
-- )

-- -- Keymap para cerrar la ventana flotante del visor
-- vim.api.nvim_set_keymap(
--   'n',
--   '<Leader>vk',
--   [[<Cmd>lua require('config.photo_show').close_image_window()<CR>]],
--   { noremap = true, silent = true }
-- )
