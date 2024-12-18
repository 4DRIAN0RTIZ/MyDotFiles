-- ~/.config/nvim/lua/config/como_hoy.lua
-- Módulo para mostrar en la winbar una respuesta de una API de un "día como hoy" en la historia con estilos personalizados

local M = {}
local updated = false
local efemeride_message = nil

-- Crear un grupo de resaltado para estilizar la winbar
vim.api.nvim_set_hl(0, 'WinbarEfemeride', { fg = '#A3BE8C', bold = true }) -- Verde pastel oscuro y negritas
vim.api.nvim_set_hl(0, 'WinbarError', { fg = '#BF616A', italic = true }) -- Rojo pastel oscuro e itálica

-- Función para obtener la fecha actual en el formato "dd_mm"
local function get_current_date()
  return os.date("%d_%m")
end

-- Función para obtener datos de la API
local function fetch_data(callback)
  local date = get_current_date()
  vim.system({
    'curl', '-s', '-X', 'POST',
    'http://ec2-18-219-30-198.us-east-2.compute.amazonaws.com/obtener_efemeride',
    '-H', 'Content-Type: application/json',
    '-d', string.format('{"fecha": "%s"}', date)
  }, {
    text = true,
  }, function(obj)
    if obj.stdout and obj.stdout ~= "" then
      vim.system({
        'jq', '-r', '.efemeride'
      }, {
        stdin = obj.stdout,
        text = true,
      }, function(jq_obj)
        if jq_obj.stdout and jq_obj.stdout ~= "" then
          -- Limpiar caracteres nulos y saltos de línea
          local cleaned_output = jq_obj.stdout:gsub("%z", ""):gsub("%s+$", "")
          callback(cleaned_output)
        else
          callback(nil, "No data available")
        end
      end)
    else
      callback(nil, "No data available")
    end
  end)
end

-- Función para actualizar la winbar con estilos personalizados
function M.update_winbar()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname:match("NERD_tree") or bufname:match("Aerial") then
    return
  end

  if efemeride_message then
    vim.schedule(function()
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_set_option_value('winbar', '%#WinbarEfemeride#' .. efemeride_message, { scope = 'local', win = win })
    end)
  end
end

-- Función para obtener y almacenar el mensaje de la efeméride
local function fetch_and_store_message()
  fetch_data(function(data, err)
    vim.schedule(function()
      if data then
        efemeride_message = data
      else
        efemeride_message = err
      end
      updated = true
      M.update_winbar()
    end)
  end)
end

-- Configurar un autocomando para actualizar la winbar al iniciar Neovim
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('UpdateWinbar', { clear = true }),
  callback = function()
    fetch_and_store_message()
  end,
})

-- Configurar un autocomando para actualizar la winbar al cambiar de buffer
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('UpdateWinbarOnBufEnter', { clear = true }),
  callback = function()
    M.update_winbar()
  end,
})

-- Crear un comando de usuario para actualizar la winbar manualmente
vim.api.nvim_create_user_command('UnDiaComoHoy', function()
  fetch_and_store_message()
end, {})

return M
