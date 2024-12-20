local M = {}
local win_id = nil
local timer = nil

-- Función para obtener la hora actual
local function get_time()
  return os.date("*t")
end

-- Función para convertir un número decimal a binario con un número fijo de bits
local function decimal_a_binario(numero, bits)
  local binario = ""
  while bits > 0 do
    local resto = numero % 2
    binario = resto .. binario
    numero = math.floor(numero / 2)
    bits = bits - 1
  end
  return binario
end

-- Función para convertir una cadena binaria a una cadena de caracteres de encendido y apagado
local function binario_a_encendido_apagado(binario)
  return binario:gsub("1", "█ "):gsub("0", "░ ")
end

local function ajustar_dia_semana(wday)
  return (wday == 1) and 7 or (wday - 1)
end

-- Función para obtener la hora, minutos, día de la semana y día del mes en formato binario
local function get_binary_time()
  local time = get_time()
  local binary_time = {
    hour = binario_a_encendido_apagado(decimal_a_binario(time.hour, 5)),  -- 5 bits para las horas
    minute = binario_a_encendido_apagado(decimal_a_binario(time.min, 6)),  -- 6 bits para los minutos
    weekday = binario_a_encendido_apagado(decimal_a_binario(ajustar_dia_semana(time.wday), 3)),  -- 3 bits para el día de la semana
    day = binario_a_encendido_apagado(decimal_a_binario(time.day, 5)),  -- 5 bits para el día del mes
    month = binario_a_encendido_apagado(decimal_a_binario(time.month, 4)),  -- 4 bits para el mes
  }
  return binary_time
end

-- Actualizar el contenido del reloj binario
local function update_binary_clock()
  if not win_id or not vim.api.nvim_win_is_valid(win_id) then return end

  local binary_time = get_binary_time()
  local lines = {
    binary_time.hour,
    "", -- Línea en blanco entre horas y minutos
    binary_time.minute,
    "", -- Línea en blanco entre minutos y día de la semana
    binary_time.weekday,
    "", -- Línea en blanco entre día de la semana y día del mes
    binary_time.day,
    "", -- Línea en blanco entre día del mes y mes
    binary_time.month,
  }

  local buf = vim.api.nvim_win_get_buf(win_id)
  vim.api.nvim_buf_set_option(buf, 'modifiable', true) -- Permitir modificación
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false) -- Deshabilitar modificación
end

-- Función para actualizar la posición de la ventana flotante
local function update_window_position()
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    local win_width = 12
    local win_height = 10 -- Incrementado para incluir días y espacios
    local row = height - win_height - 3 -- Posición más arriba
    local col = width - win_width - 1
    vim.api.nvim_win_set_config(win_id, {
      relative = 'editor',
      width = win_width,
      height = win_height,
      row = row,
      col = col,
    })
  end
end

-- Configurar temporizador inicial
local function start_timer()
  if timer then
    timer:stop()
    timer:close()
  end
  timer = vim.loop.new_timer()

  -- Calcular cuánto falta para el próximo minuto completo
  local current_time = os.date("*t")
  local delay = (60 - current_time.sec) * 1000 -- Milisegundos hasta el próximo minuto

  -- Iniciar el temporizador con el retraso inicial
  timer:start(delay, 60000, vim.schedule_wrap(update_binary_clock))
end

-- Función para mostrar el reloj binario
function M.mostrar_reloj_binario()
  if win_id and vim.api.nvim_win_is_valid(win_id) then return end

  local binary_time = get_binary_time()
  local lines = {
    binary_time.hour,
    "", -- Línea en blanco entre horas y minutos
    binary_time.minute,
    "", -- Línea en blanco entre minutos y día de la semana
    binary_time.weekday,
    "", -- Línea en blanco entre día de la semana y día del mes
    binary_time.day,
    "", -- Línea en blanco entre día del mes y mes
    binary_time.month,
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  local win_width = 12
  local win_height = 10 -- Incrementado para incluir días y espacios
  local row = height - win_height - 3 -- Posición más arriba
  local col = width - win_width - 1

  win_id = vim.api.nvim_open_win(buf, false, { -- Sin robar enfoque
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- Configurar actualización automática cada minuto
  start_timer()

  -- Actualizar posición de la ventana en caso de cambio de tamaño
  vim.cmd([[
    augroup BinaryClock
      autocmd!
      autocmd VimResized * lua require('config.binary_clock').update_window_position()
    augroup END
  ]])
end

-- Función para cerrar el reloj binario
function M.cerrar_reloj_binario()
  if timer then
    timer:stop()
    timer:close()
    timer = nil
  end
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    vim.api.nvim_win_close(win_id, true)
    win_id = nil
  end
end

-- Exponer la función de actualización de posición
M.update_window_position = update_window_position

return M
