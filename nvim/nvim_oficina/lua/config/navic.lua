-- ~/.config/nvim/lua/plugins/navic.lua

local M = {}

function M.setup()
    -- Configuración por defecto de nvim-navic
    require('nvim-navic').setup {
        icons = {
            File = ' ',
            Module = ' ',
            Namespace = ' ',
            Package = ' ',
            Class = 'ﴯ ',
            Method = ' ',
            Property = 'ﰠ ',
            Field = 'ﰠ ',
            Constructor = ' ',
            Enum = ' ',
            Interface = ' ',
            Function = ' ',
            Variable = ' ',
            Constant = ' ',
            String = ' ',
            Number = ' ',
            Boolean = '蘒',
            Array = ' ',
            Object = ' ',
            Key = ' ',
            Null = 'ﳠ ',
            EnumMember = ' ',
            Struct = ' ',
            Event = ' ',
            Operator = ' ',
            TypeParameter = ' '
        },
        highlight = true,
        separator = " > ",
        depth_limit = 0,
        depth_limit_indicator = ".."
    }
end

return M
