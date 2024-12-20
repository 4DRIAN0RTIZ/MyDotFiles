-- ~/.config/nvim/lua/config/settings.lua

-- Load plugins
require('plugins')

-- Load plugin configurations
require('config.aerial')
require('config.binary_clock').mostrar_reloj_binario()
require('config.bufferline')
require('config.chatgpt')
require('config.codewindow')
require('config.colorizer')
require('config.como_hoy')
require('config.copilot')
require('config.copilot_chat')
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
require('config.telescope')
require('config.themes')
require('config.toggleterm')
require('config.trouble')
require('config.whichkey')
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
-- require('config.cyberdream')
-- require('config.dadbod')
-- require('config.dap')
-- require('config.navic')
-- require('config.sqls')
-- require('config.todo_comments')
