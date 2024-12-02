local M = {}

local timers = {
    pomodoro = 25 * 60,
    short_break = 5 * 60,
    long_break = 15 * 60,
}

local status = {
    mode = "idle",
    time_left = 0,
    pomodoros_completed = 0,
    description = "",
}

local pomodoro_dir = vim.fn.stdpath('data') .. '/pomodoro'
local pomodoro_log_file = pomodoro_dir .. '/pomodoros.json'
local pomodoro_state_file = pomodoro_dir .. '/state.json'
local pomodoros = {}

-- Función para asegurar que el directorio existe
local function ensure_directory(dir)
    local stat = vim.loop.fs_stat(dir)
    if not stat then
        local ok, err = vim.loop.fs_mkdir(dir, 511) -- 511 = 0777 en octal
        if not ok then
            notify("No se pudo crear el directorio: " .. err, "Error")
        end
    end
end

local function format_time(seconds)
    local minutes = math.floor(seconds / 60)
    local remaining_seconds = seconds % 60
    return string.format("%02d:%02d", minutes, remaining_seconds)
end

local function notify(msg, title)
    vim.notify(msg, vim.log.levels.INFO, { title = title or "Pomodoro" })
end

local function save_pomodoros()
    ensure_directory(pomodoro_dir)
    local f = io.open(pomodoro_log_file, 'w')
    if f then
        local content = vim.fn.json_encode(pomodoros)
        f:write(content)
        f:close()
    else
        notify("No se pudo guardar el archivo de pomodoros.", "Error")
    end
end

local function load_pomodoros()
    ensure_directory(pomodoro_dir)
    local f = io.open(pomodoro_log_file, 'r')
    if f then
        local content = f:read('*a')
        f:close()
        if content and content ~= '' then
            local ok, data = pcall(vim.fn.json_decode, content)
            if ok and data then
                pomodoros = data
            end
        end
    end
end

local function save_state()
    ensure_directory(pomodoro_dir)
    local f = io.open(pomodoro_state_file, 'w')
    if f then
        local content = vim.fn.json_encode(status)
        f:write(content)
        f:close()
    else
        notify("No se pudo guardar el estado del temporizador.", "Error")
    end
end



-- Aquí utilizamos os.time() para manejar el tiempo incluso cuando Neovim está cerrado
local function start_timer(mode, description, resume)
    if not timers[mode] then
        notify("Modo no válido: " .. mode, "Error")
        return
    end

    if not resume then
        status.mode = mode
        status.time_left = timers[mode]
        status.description = description or ""
        status.end_time = os.time() + status.time_left
        notify("Iniciando " .. mode .. " (" .. format_time(status.time_left) .. ")", "Pomodoro")
        save_state()
    else
        -- Al reanudar, recalcula el tiempo restante
        local current_time = os.time()
        status.time_left = status.end_time - current_time
        if status.time_left <= 0 then
            status.time_left = 0
        end
    end

    local function tick()
        if status.time_left > 0 and status.mode == mode then
            local current_time = os.time()
            status.time_left = status.end_time - current_time
            if status.time_left <= 0 then
                status.time_left = 0
            end
            save_state()
            vim.schedule(function()
                vim.cmd("redrawstatus")
            end)
            vim.defer_fn(tick, 1000)
        elseif status.mode == mode then
            if mode == "pomodoro" then
                status.pomodoros_completed = status.pomodoros_completed + 1
                local pomodoro_data = {
                    description = status.description,
                    timestamp = status.end_time,
                }
                table.insert(pomodoros, pomodoro_data)
                save_pomodoros()
                notify("Pomodoro completado. ¡Buen trabajo!", "Pomodoro")
            else
                notify("Descanso terminado. ¡De vuelta al trabajo!", "Pomodoro")
            end
            status.mode = "idle"
            status.description = ""
            status.time_left = 0
            status.end_time = nil
            save_state()
        end
    end
    tick()
end

local function load_state()
    ensure_directory(pomodoro_dir)
    local f = io.open(pomodoro_state_file, 'r')
    if f then
        local content = f:read('*a')
        f:close()
        if content and content ~= '' then
            local ok, data = pcall(vim.fn.json_decode, content)
            if ok and data and data.mode ~= "idle" then
                status = data
                notify("Reanudando " .. status.mode .. " (" .. format_time(status.time_left) .. " restantes)", "Pomodoro")
                start_timer(status.mode, status.description, true)
            end
        end
    end
end

function M.start_pomodoro()
    vim.ui.input({ prompt = 'Ingrese una descripción para el Pomodoro: ' }, function(input)
        start_timer("pomodoro", input)
    end)
end

function M.start_short_break()
    start_timer("short_break")
end

function M.start_long_break()
    start_timer("long_break")
end

function M.get_status()
    return string.format("Modo: %s | Tiempo restante: %s | Pomodoros completados: %d",
        status.mode, format_time(status.time_left), status.pomodoros_completed)
end

function M.get_lualine_status()
    if status.mode == "idle" then
        return ""
    else
        return string.format("%s (%s) - %s", status.mode, format_time(status.time_left), status.description)
    end
end

function M.view_pomodoros()
    load_pomodoros()
    if #pomodoros == 0 then
        notify("No hay pomodoros registrados.", "Pomodoro")
        return
    end

    local messages = {}
    for _, pomodoro in ipairs(pomodoros) do
        table.insert(messages, string.format(
            "Descripción: %s | Completado en: %s",
            pomodoro.description or "Sin descripción",
            os.date('%Y-%m-%d %H:%M:%S', pomodoro.timestamp)
        ))
    end
    notify(table.concat(messages, '\n'), "Pomodoros Completados")
end

function M.delete_pomodoro()
    load_pomodoros()
    if #pomodoros == 0 then
        notify("No hay pomodoros para eliminar.", "Pomodoro")
        return
    end

    vim.ui.input({ prompt = 'Ingrese la descripción del Pomodoro a eliminar: ' }, function(input)
        if not input or input == '' then
            notify("Descripción no proporcionada.", "Pomodoro")
            return
        end

        local found = false
        for i = #pomodoros, 1, -1 do  -- Recorre la tabla en orden inverso
            if pomodoros[i].description == input then
                table.remove(pomodoros, i)
                found = true
            end
        end

        if found then
            save_pomodoros()
            notify("Pomodoro(s) con descripción '" .. input .. "' eliminado(s).", "Pomodoro")
        else
            notify("No se encontró ningún pomodoro con esa descripción.", "Pomodoro")
        end
    end)
end

-- Configura comandos para Neovim
vim.api.nvim_create_user_command("PomodoroStatus", function()
    notify(M.get_status())
end, {})

vim.api.nvim_create_user_command("PomodoroStart", function()
    M.start_pomodoro()
end, {})

vim.api.nvim_create_user_command("PomodoroShortBreak", function()
    M.start_short_break()
end, {})

vim.api.nvim_create_user_command("PomodoroLongBreak", function()
    M.start_long_break()
end, {})

vim.api.nvim_create_user_command("PomodoroView", function()
    M.view_pomodoros()
end, {})

vim.api.nvim_create_user_command("PomodoroDelete", function()
    M.delete_pomodoro()
end, {})

-- Carga los pomodoros y el estado al inicio
load_pomodoros()
load_state()

return M
