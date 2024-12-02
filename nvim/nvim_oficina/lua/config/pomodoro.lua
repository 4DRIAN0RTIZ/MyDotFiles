local M = {}

local timers = {
    pomodoro = 25 * 60, -- 25 minutos
    short_break = 5 * 60, -- 5 minutos
    long_break = 15 * 60, -- 15 minutos
}

local status = {
    mode = "idle", -- Modos: "idle", "pomodoro", "short_break", "long_break"
    time_left = 0,
    pomodoros_completed = 0,
}

local function format_time(seconds)
    local minutes = math.floor(seconds / 60)
    local remaining_seconds = seconds % 60
    return string.format("%02d:%02d", minutes, remaining_seconds)
end

local function notify(msg, title)
    vim.notify(msg, vim.log.levels.INFO, { title = title or "Pomodoro" })
end

local function start_timer(mode)
    if not timers[mode] then
        notify("Modo no válido: " .. mode, "Error")
        return
    end

    status.mode = mode
    status.time_left = timers[mode]
    notify("Iniciando " .. mode .. " (" .. format_time(status.time_left) .. ")", "Pomodoro")

vim.defer_fn(function()
    local function tick()
        if status.time_left > 0 and status.mode == mode then
            status.time_left = status.time_left - 1
            vim.schedule(function()
                vim.cmd("redrawstatus") -- Actualiza la barra de estado
            end)
            vim.defer_fn(tick, 1000) -- Llamada recursiva correcta
        elseif status.mode == mode then
            if mode == "pomodoro" then
                status.pomodoros_completed = status.pomodoros_completed + 1
                notify("Pomodoro completado. ¡Buen trabajo!", "Pomodoro")
            else
                notify("Descanso terminado. ¡De vuelta al trabajo!", "Pomodoro")
            end
            status.mode = "idle"
        end
    end
    tick()
end, 1000)
end

function M.start_pomodoro()
    start_timer("pomodoro")
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
        return string.format("%s (%s)", status.mode, format_time(status.time_left))
    end
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

return M
