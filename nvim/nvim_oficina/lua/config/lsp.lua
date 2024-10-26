-- ~/.config/nvim/lua/plugins/lsp.lua
local lspconfig = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

lspconfig.html.setup{}
lspconfig.ts_ls.setup{}

lsp_installer.setup({
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

lspconfig.sqls.setup({
    cmd = {"sqls"},
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr) -- require sqls.nvim
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
