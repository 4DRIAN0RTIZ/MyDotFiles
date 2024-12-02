local function get_current_database()
    local filetype = vim.bo.filetype
    if filetype == 'sql' then
        if vim.g.current_database then
            return 'DB: ' .. vim.g.current_database
        else
            return 'DB: N/A'
        end
    else
        return ''
    end
end

-- Función para obtener la hora actual
local function get_time()
    return os.date("%A, %d/%m/%y %H:%M:%S")
end

-- Función para obtener el ticket actual
local function working_on_ticket()
    local file = io.open(os.getenv("HOME") .. "/.last_ticket", "r")
    if file == nil then
        return ""
    end

    local ticket = file:read("*all")
    -- Remover el salto de línea
    ticket = string.gsub(ticket, "\n", "")
    file:close()

    return "T " .. ticket
end

-- Función para mostrar el fin del día laboral
local function end_laboral_day()
    local date_time = os.date("*t")
    local day = date_time.wday
    local current_hour = date_time.hour
    local current_minute = date_time.min
    local current_second = date_time.sec

    local end_hour = 16
    local end_minute = 0
    local end_second = 0

    -- Ajustar la hora de finalización para el domingo
    if day == 7 then
        end_hour = 14
    end

    -- Calcular el tiempo restante en segundos
    local total_seconds_left = (end_hour * 3600 + end_minute * 60 + end_second) - (current_hour * 3600 + current_minute * 60 + current_second)

    if total_seconds_left < 0 then
        -- Calcular segundos y minutos de retraso
        local seconds_late = math.abs(total_seconds_left)
        local minutes_late = math.floor(seconds_late / 60)
        seconds_late = seconds_late % 60

        local message = "Late by "

        if minutes_late > 0 then
            message = message .. string.format("%d M and ", minutes_late)
        end

        message = message .. string.format("%d S", seconds_late)

        return message
    else
        -- Calcular las horas, minutos y segundos restantes
        local hours_left = math.floor(total_seconds_left / 3600)
        local minutes_left = math.floor((total_seconds_left % 3600) / 60)
        local seconds_left = total_seconds_left % 60

        -- Construir el mensaje basado en las horas, minutos y segundos restantes
        local message = "End laboral day in "

        if hours_left > 0 then
            message = message .. string.format("%d H, ", hours_left)
        end

        if minutes_left > 0 then
            message = message .. string.format("%d M, ", minutes_left)
        end

        -- Siempre mostramos los segundos
        message = message .. string.format("%d S", seconds_left)

        return message
    end
end

local function get_pomodoro_status()
    local pomodoro = require('config.pomodoro')
    if pomodoro then
        return pomodoro.get_lualine_status()
    else    
        return ""
    end
end

-- Configuración de lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_lsp', 'coc'}}},
        lualine_c = {'filename'},
        lualine_x = { get_pomodoro_status, get_current_database, working_on_ticket, get_time, end_laboral_day, 'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive'}
}
