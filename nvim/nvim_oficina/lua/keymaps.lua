-- Configuración de Leader Key
vim.g.mapleader = ' '

-- =====================================
-- CONFIGURACIÓN BÁSICA
-- =====================================

-- Formatear código seleccionado con CocAction
vim.api.nvim_set_keymap('v', '<leader>f', ':call CocAction("format")<CR>', { noremap = true, silent = true })

-- Recargar configuración
vim.api.nvim_set_keymap('n', ';rc', ':luafile ~/.config/nvim/init.lua<CR>:lua vim.notify("Configuración recargada")<CR>', { noremap = true, silent = true })

-- Guardar archivo
-- vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Cerrar ventana
-- vim.api.nvim_set_keymap('n', '<C-w>', ':q<CR>', { noremap = true, silent = true })

-- Navegar entre buffers
-- vim.api.nvim_set_keymap('n', '<C-p>', ':bnext<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-o>', ':bprevious<CR>', { noremap = true, silent = true })

-- =====================================
-- IDENTACIÓN
-- =====================================

-- Mantener selección después de identar
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

-- =====================================
-- COPILOT CONFIGURACIÓN
-- =====================================

-- Copilot.lua
vim.keymap.set("i", '<Tab>', function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { silent = true })

-- Copilot.vim (Comentarios)
-- vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(copilot-next)', {})
-- vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-previous)', {})

-- =====================================
-- CODEIUM CONFIGURACIÓN
-- =====================================

-- Mapeos para navegar entre las sugerencias de Codeium
-- vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-k>', function() return vim.fn end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })

-- =====================================
-- TELESCOPE
-- =====================================

-- Buscar archivos
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })

-- Live Grep
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

-- Comentarios TODO, FIXME, etc.
vim.api.nvim_set_keymap('n', ';tc', ':TodoTelescope<CR>', { noremap = true, silent = true })

-- =====================================
-- EXPLORADOR DE ARCHIVOS (NvimTree)
-- =====================================

-- Alternar NvimTree
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- =====================================
-- FORMATEO Y LINTERS
-- =====================================

-- Prettier
vim.api.nvim_create_user_command('Prettier', 'CocCommand prettier.forceFormatDocument', {})
vim.api.nvim_set_keymap('n', '<leader>pr', ':Prettier<CR>', { noremap = true, silent = true })

-- =====================================
-- COMENTARIOS
-- =====================================

-- Comentario con Commentary
vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })

-- =====================================
-- EMmet
-- =====================================

vim.g.user_emmet_mode = 'n'
vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx'
  }
}

-- =====================================
-- COLORIZER
-- =====================================

vim.api.nvim_set_keymap('n', '<leader>hc', ':ColorizerToggle<CR>', { noremap = true, silent = true })

-- =====================================
-- DIFFVIEW
-- =====================================

vim.api.nvim_set_keymap('n', ';df', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';dt', ':DiffviewToggleFiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';dr', ':DiffviewRefresh<CR>', { noremap = true, silent = true })

-- =====================================
-- COPILOT CHAT
-- =====================================

vim.api.nvim_set_keymap('n', ';ct', ':CopilotChatToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';ce', ':CopilotChatExplain<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';cr', ':CopilotChatRefactor<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';co', ':CopilotChatOptimize<CR>', { noremap = true, silent = true })

-- =====================================
-- GESTIÓN DE VENTANAS
-- =====================================

-- Dividir ventanas
vim.api.nvim_set_keymap('n', '<C-v>', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':split<CR>', { noremap = true, silent = true })

-- Navegación entre ventanas
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

-- Redimensionar ventanas
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -5<CR>', { noremap = true, silent = true })

-- Cerrar ventana
vim.api.nvim_set_keymap('n', '<C-q>', ':close<CR>', { noremap = true, silent = true })

-- =====================================
-- OPERACIONES VARIAS
-- =====================================

-- Remover ^M de archivos
vim.api.nvim_set_keymap('n', '<leader>rm', ':silent %s/\\r//g<CR>', { noremap = true, silent = true })

-- Mover líneas arriba y abajo con Alt + j/k
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Reemplazar `<?php echo` con `<?=` en PHP
vim.api.nvim_set_keymap('n', ';cph', ':%s/<?php echo/<?=/g<CR>', { noremap = true, silent = true })

-- =====================================
-- GESTIÓN DE NOTAS DE TICKETS
-- =====================================

vim.api.nvim_set_keymap('n', ';tn', ':lua require("config.ticket_notes").new_note()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';tl', ':lua require("config.ticket_notes").list_notes()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';te', ':lua require("config.ticket_notes").edit_note("<ID_DEL_TICKET>")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';td', ':lua require("config.ticket_notes").delete_note("<ID_DEL_TICKET>")<CR>', { noremap = true, silent = true })

-- =====================================
-- PLAYGROUNDS DE SQL
-- =====================================

vim.api.nvim_set_keymap('n', ';op', ':lua require("config.ticket_playground").open_playground()<CR>', { noremap = true, silent = true })

-- =====================================
-- FUNCIONES PERSONALIZADAS
-- =====================================

-- Insertar código
vim.api.nvim_set_keymap('n', ';ic', ':lua insert_code()<CR>', { noremap = true, silent = true })

-- Reemplazar `<?php echo` con `<?=` en todo el archivo
vim.api.nvim_set_keymap('n', ';ec', ':%s/<?php echo/<?=/g<CR>', { noremap = true, silent = true })

-- Insertar y remover `print_r`
vim.api.nvim_set_keymap('n', ';pr', ':lua print_r()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';rpr', ':lua remove_print_r()<CR>', { noremap = true, silent = true })

-- Insertar y remover `echo $sql; exit;`
vim.api.nvim_set_keymap('n', ';sqle', ':lua insert_sql_echo()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';rsqle', ':lua remove_sql_echo()<CR>', { noremap = true, silent = true })

-- Ejecutar consulta SQL
vim.api.nvim_set_keymap('n', ';qsql', ':lua sql_query()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';qsql', ':lua sql_query()<CR>', { noremap = true, silent = true })

-- Remover `file_put_contents('')`
vim.api.nvim_set_keymap('n', ';rfpc', ':lua remove_file_put_content()<CR>', { noremap = true, silent = true })

-- =====================================
-- TODO COMMENTS
-- =====================================

vim.api.nvim_set_keymap('n', ';tc', ':TodoTelescope<CR>', { noremap = true, silent = true })

-- =====================================
-- SQLS
-- =====================================

-- Ejecutar consulta SQL del archivo completo
vim.api.nvim_set_keymap('n', ';eq', '<Plug>(sqls-execute-query)', { noremap = true, silent = true })

-- Ejecutar consulta SQL del rango seleccionado
-- vim.api.nvim_set_keymap('v', ';eq', '<Plug>(sqls-execute-query)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';eq', ':<C-U>botright \'<,\'>SqlsExecuteQuery<CR>', { noremap = true, silent = true })

-- =====================================
-- ENVOLVER SELECCIÓN
-- =====================================

vim.api.nvim_set_keymap('x', '"', ':<C-u>lua require("config.envolver").wrap_selection(\'"\', \'"\')<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', "'", ':<C-u>lua require("config.envolver").wrap_selection("\'", "\'")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '(', ':<C-u>lua require("config.envolver").wrap_selection(\'(\', \')\')<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '[', ':<C-u>lua require("config.envolver").wrap_selection(\'[\', \']\')<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '{', ':<C-u>lua require("config.envolver").wrap_selection(\'{\', \'}\')<CR>', { noremap = true, silent = true })

-- =====================================
-- POMODORO
-- =====================================

vim.api.nvim_set_keymap('n', ';pst', ':lua require("config.pomodoro").start_pomodoro()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';psb', ':lua require("config.pomodoro").start_short_break()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';plb', ':lua require("config.pomodoro").start_long_break()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';ppv', ':lua require("config.pomodoro").view_pomodoros()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';ppd', ':lua require("config.pomodoro").delete_pomodoro()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';pss', ':PomodoroStatus<CR>', { noremap = true, silent = true })

-- =====================================
-- GESTIÓN DE FUNCIONES
-- =====================================

-- Seleccionar función
vim.api.nvim_set_keymap('n', ';bs', 'v%0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';bsc', 'v%0y', { noremap = true, silent = true })

-- =====================================
-- CODEWINDOW
-- =====================================

vim.api.nvim_set_keymap('n', ';mms', ':lua require("codewindow").toggle_minimap()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';mmf', ':lua require("codewindow").toggle_focus()<CR>', { noremap = true, silent = true }) -- Enfocar minimapa


-- =====================================
-- DUCK
-- =====================================

vim.api.nvim_set_keymap('n', ';ds', ':lua require("duck").hatch("🎄")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';dk', ':lua require("duck").cook()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';da', ':lua require("duck").cook_all()<CR>', { noremap = true, silent = true })

-- =====================================
-- GITSIGNS
-- =====================================

vim.api.nvim_set_keymap('n', '<leader>gbl', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Gitsigns blame<CR>', { noremap = true, silent = true })
