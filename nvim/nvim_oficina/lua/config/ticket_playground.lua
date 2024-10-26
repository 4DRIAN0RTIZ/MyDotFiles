-- ~/.config/nvim/lua/custom/playground.lua

local M = {}

-- Función para obtener el nombre del ticket desde el archivo .last_ticket
function M.get_ticket_name()
    local last_ticket_file = vim.fn.expand('~/.last_ticket')
    if vim.fn.filereadable(last_ticket_file) == 1 then
        local ticket_name = vim.fn.readfile(last_ticket_file)[1]
        return ticket_name
    else
        print("No se encontró el archivo .last_ticket")
        return nil
    end
end

-- Función para crear y abrir el archivo playground_<ticket>.sql
function M.open_playground()
    local ticket_name = M.get_ticket_name()
    if ticket_name then
        local playground_dir = vim.fn.stdpath('data') .. '/ticket_playground'
        local playground_file = playground_dir .. '/playground_' .. ticket_name .. '.sql'

        -- Crear el directorio si no existe
        if vim.fn.isdirectory(playground_dir) == 0 then
            vim.fn.mkdir(playground_dir, 'p')
        end

        -- Crear y abrir el archivo
        vim.cmd('edit ' .. playground_file)
    end
end

return M

