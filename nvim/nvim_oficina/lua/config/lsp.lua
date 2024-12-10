-- ~/.config/nvim/lua/plugins/lsp.lua

-- Configuración para ventanas flotantes con bordes personalizados y transparencia

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

-- Establece transparencia para las ventanas flotantes
vim.cmd [[
    highlight NormalFloat guibg=NONE guifg=#abb2bf
    highlight FloatBorder guibg=NONE guifg=#61afef
]]

vim.o.winblend = 20 -- Ajusta la transparencia de las ventanas flotantes

local lspconfig = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

-- Configuración de nvim-lsp-installer
lsp_installer.setup({
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

local on_attach = function(client, bufnr)
    -- Si el servidor soporta documentSymbolProvider, attach navic
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
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
