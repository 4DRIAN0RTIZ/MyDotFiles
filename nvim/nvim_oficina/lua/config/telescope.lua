-- ~/.config/nvim/lua/plugins/telescope.lua
require('telescope').setup {
  extensions = {
    live_grep_args = {
      prompt_title = 'Live Grep Args',
      prompt_prefix = 'Args> ',
    },
    dap = {
      prompt_title = 'DAP',
      prompt_prefix = 'DAP> ',
    },
  }
}

-- Carga la extensión dap
require('telescope').load_extension('dap')

-- Configura nvim-dap con PHP
local dap = require('dap')

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003
    }
}
