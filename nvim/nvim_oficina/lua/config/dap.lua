-- ~/.config/nvim/lua/config/dap.lua
local dap = require('dap')
local dapui = require('dapui')
local dap_virtual_text = require('nvim-dap-virtual-text')

-- Configuración para la interfaz de usuario
dapui.setup()
dap_virtual_text.setup()

-- Configuración del adaptador para PHP
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/home/neandertech/vscode-php-debug/out/phpDebug.js' },
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Run and Listen for Xdebug',
        port = 9003,
        log = true,
    }
}

-- Configuración del adaptador para Python
dap.adapters.python = {
    type = 'executable',
    command = 'python3',
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = function()
            return '/usr/bin/python3'
        end,
    },
}

-- Abrir/cerrar la interfaz de usuario automáticamente
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
