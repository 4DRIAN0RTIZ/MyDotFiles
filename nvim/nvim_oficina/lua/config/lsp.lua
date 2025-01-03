-- ~/.config/nvim/lua/plugins/lsp.lua

navic = require('nvim-navic')

-- Define el estilo de los bordes
local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

-- Modifica las ventanas flotantes del LSP para usar bordes personalizados
vim.lsp.util.open_floating_preview = (function(orig)
    return function(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig(contents, syntax, opts, ...)
    end
end)(vim.lsp.util.open_floating_preview)

local lspconfig = require('lspconfig')
local mason = require('mason')

-- Configuración de mason
mason.setup({
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
    },
})

-- Configurar servidores automáticamente
local servers = { 'pyright', 'html', 'ts_ls', 'sqls', 'intelephense' }
vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = true,
})

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", ";dd", vim.diagnostic.open_float, bufopts)

    -- Autocomando para expandir el texto virtual al pasar por la línea
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
    })
end

-- Configuración personalizada para sqls
lspconfig.sqls.setup({
    cmd = { "sqls" },
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
        if client.config.settings and client.config.settings.sqls and client.config.settings.sqls.connections then
            local connections = client.config.settings.sqls.connections
            if connections[1] and connections[1].dataSourceName then
                local dataSourceName = connections[1].dataSourceName
                local db_name = dataSourceName:match("database=([^&]+)")
                if db_name then
                    vim.g.current_database = db_name
                else
                    vim.g.current_database = 'N/A'
                end
            end
        end

        vim.api.nvim_create_autocmd('User', {
            pattern = 'SqlsConnectionChoice',
            callback = function(args)
                local choice = args.data.choice
                vim.g.current_database = choice:match("database=([^&]+)")
            end
        })
    end,
    settings = {
        sqls = {
            connections = {
                {
                    driver = 'mssql',
                    dataSourceName = 'sqlserver://osador:Os@dor$@192.168.0.3:1433?database=ctSystem_PBA&encrypt=true&trustServerCertificate=true',
                },
                {
                    driver = 'mssql',
                    dataSourceName = 'sqlserver://osador:Os@dor$@192.168.0.3:1433?database=ctSystem&encrypt=true&trustServerCertificate=true',
                },
            },
        },
    },
})

-- Configuración personalizada para pyright

lspconfig.pyright.setup({
    on_attach = function(client, bufnr)

        local opts = { noremap = true, silent = true }
        -- Atajos para navegar diagnósticos
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict", -- Cambia a "basic" para menor rigidez
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- Puede ser "openFilesOnly" o "workspace"
            },
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
})
