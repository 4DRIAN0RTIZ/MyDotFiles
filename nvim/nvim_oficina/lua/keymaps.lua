vim.g.mapleader = ' '

-- CONFIGURATION KEYMAPS
-- vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-w>', ':q<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<C-p>', ':bnext<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<C-o>', ':bprevious<CR>', { noremap = true, silent = true })

-- Configuracion para identación continua y mantener selección después de identar
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

-- Copilot.lua CONF
vim.keymap.set("i", '<Tab>', function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, {
  silent = true,
})
-- Copilot.vim Conf
-- vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(copilot-next)', {})
-- vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-previous)', {})

-- Codeium.vim Conf

-- Mapeos para navegar entre las sugerencias. -- En init.lua se deshabilitó las bindings por defecto
-- vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })

-- Telescope live grep
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

-- CurlVim
vim.api.nvim_set_keymap('n', ';cv', '<cmd>lua require("config.curlvim").detect_route()<cr>', { noremap = true, silent = true })

-- Toggle NvimTree
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Prettier Conf
vim.api.nvim_create_user_command('Prettier', 'CocCommand prettier.forceFormatDocument', {})
vim.api.nvim_set_keymap('n', '<leader>pr', ':Prettier<CR>', { noremap = true, silent = true })

-- Telescope Conf
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })

-- Commentary Conf
vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })

-- Emmet Conf
vim.g.user_emmet_mode = 'n'
vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx'
  }
}

-- Colorizer Conf
vim.api.nvim_set_keymap('n', '<leader>hc', ':ColorizerToggle<CR>', { noremap = true, silent = true })

-- Diffview Conf
-- Open Diffview
vim.api.nvim_set_keymap('n', ';df', ':DiffviewOpen<CR>', { noremap = true, silent = true })
-- Toggle Diffview
vim.api.nvim_set_keymap('n', ';dt', ':DiffviewToggleFiles<CR>', { noremap = true, silent = true })
-- Refresh Diffview
vim.api.nvim_set_keymap('n', ';dr', ':DiffviewRefresh<CR>', { noremap = true, silent = true })

-- CopilotChat Conf
vim.api.nvim_set_keymap('n', ';ct', ':CopilotChatToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';ce', ':CopilotChatExplain<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';cr', ':CopilotChatRefactor<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';co', ':CopilotChatOptimize<CR>', { noremap = true, silent = true })

-- Window split and navigation Conf
-- Split window vertically
vim.api.nvim_set_keymap('n', '<C-v>', ':vsplit<CR>', { noremap = true, silent = true })
-- Split window horizontally
vim.api.nvim_set_keymap('n', '<C-s>', ':split<CR>', { noremap = true, silent = true })
-- Move to the left Window
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- Move to the right Window
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- Move to the upper Window
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- Move to the lower Window
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- Resize Window
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -5<CR>', { noremap = true, silent = true })
-- Close Window
vim.api.nvim_set_keymap('n', '<C-q>', ':close<CR>', { noremap = true, silent = true })

-- Remove ^M from files
vim.api.nvim_set_keymap('n', '<leader>rm', ':silent %s/\\r//g<CR>', { noremap = true, silent = true })

-- Move lines up and down with Alt + j/k
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Map to replace <?php echo with <?= in PHP files
vim.api.nvim_set_keymap('n', ';cph', ':%s/<?php echo/<?=/g<CR>', { noremap = true, silent = true })

-- Keymaps para gestionar notas de tickets
vim.api.nvim_set_keymap('n', ';tn', ':lua require("config.ticket_notes").new_note()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';tl', ':lua require("config.ticket_notes").list_notes()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';te', ':lua require("config.ticket_notes").edit_note("<ID_DEL_TICKET>")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';td', ':lua require("config.ticket_notes").delete_note("<ID_DEL_TICKET>")<CR>', { noremap = true, silent = true })

-- Keymaps para gestionar los playgrounds de SQL
vim.api.nvim_set_keymap('n', ';op', ':lua require("config.ticket_playground").open_playground()<CR>', { noremap = true, silent = true })

-- Keymaps
vim.api.nvim_set_keymap('n', ';ic', ':lua insert_code()<CR>', { noremap = true, silent = true }) -- Esto ingresa el $login = "hdorantes" en la línea de arriba
vim.api.nvim_set_keymap('n', ';ec', ':%s/<?php echo/<?=/g<CR>', { noremap = true, silent = true }) -- Esto reemplaza <?php echo por <?= en todo el archivo
vim.api.nvim_set_keymap('n', ';pr', ':lua print_r()<CR>', { noremap = true, silent = true }) -- Esto ingresa un print_r($_POST) en la línea de arriba
vim.api.nvim_set_keymap('n', ';rpr', ':lua remove_print_r()<CR>', { noremap = true, silent = true }) -- Esto elimina el print_r($_POST) del archivo
vim.api.nvim_set_keymap('n', ';sqle', ':lua insert_sql_echo()<CR>', { noremap = true, silent = true }) -- Esto ingresa un echo $sql; exit; en la línea de arriba
vim.api.nvim_set_keymap('n', ';rsqle', ':lua remove_sql_echo()<CR>', { noremap = true, silent = true }) -- Esto elimina el echo $sql; exit; del archivo
vim.api.nvim_set_keymap('n', ';qsql', ':lua sql_query()<CR>', { noremap = true, silent = true }) -- Esto hace una consulta SQL en la linea seleccionada
vim.api.nvim_set_keymap('v', ';qsql', ':lua sql_query()<CR>', { noremap = true, silent = true }) -- Esto hace una consulta SQL en la linea seleccionada
vim.api.nvim_set_keymap('n', ';rfpc', ':lua remove_file_put_content()<CR>', { noremap = true, silent = true }) -- Esto elimina el file_put_contents('') del archivo

-- Keymaps para todo_comments
vim.api.nvim_set_keymap('n', ';tc', ':TodoTelescope<CR>', { noremap = true, silent = true }) -- Esto abre Telescope con los comentarios TODO, FIXME, etc

-- Keymaps para sqls
vim.api.nvim_set_keymap('n', ';eq', '<Plug>(sqls-execute-query)', { noremap = true, silent = true }) -- Esto hace una consulta SQL de todo el archivo
-- vim.api.nvim_set_keymap('v', ';eq', '<Plug>(sqls-execute-query)', { noremap = true, silent = true }) -- Esto hace una consulta SQL del rango seleccionado
vim.api.nvim_set_keymap('v', ';eq', ':<C-U>botright \'<,\'>SqlsExecuteQuery<CR>', { noremap = true, silent = true })


-- Mapeos para envolver con diferentes caracteres
vim.api.nvim_set_keymap('x', '"', ':<C-u>lua require("config.envolver").wrap_selection(\'"\', \'"\')<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', "'", ':<C-u>lua require("config.envolver").wrap_selection("\'", "\'")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '(', ':<C-u>lua require("config.envolver").wrap_selection(\'(\', \')\')<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '[', ':<C-u>lua require("config.envolver").wrap_selection(\'[\', \']\')<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '{', ':<C-u>lua require("config.envolver").wrap_selection(\'{\', \'}\')<CR>', { noremap = true, silent = true })

-- Mapeos para pomodoro
vim.api.nvim_set_keymap('n', ';pst', ':lua require("config.pomodoro").start_pomodoro()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';psb', ':lua require("config.pomodoro").start_short_break()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';plb', ':lua require("config.pomodoro").start_long_break()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';ppv', ':lua require("config.pomodoro").view_pomodoros()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';ppd', ':lua require("config.pomodoro").delete_pomodoro()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';pss', ':PomodoroStatus<CR>', { noremap = true, silent = true })


-- Mapeo para seleccionar función

vim.api.nvim_set_keymap('n', ';bs', 'v%0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';bsc', 'v%0y', { noremap = true, silent = true })
