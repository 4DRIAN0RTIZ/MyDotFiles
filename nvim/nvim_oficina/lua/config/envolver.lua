-- ~/.config/nvim/lua/config/envolver.lua
local M = {}

function M.wrap_selection(open, close)
  local _, sl, sc, _ = unpack(vim.fn.getpos("'<")) -- Inicio de la selección
  local _, el, ec, _ = unpack(vim.fn.getpos("'>")) -- Final de la selección
  local lines = vim.fn.getline(sl, el) -- Obtener las líneas seleccionadas

  if #lines == 0 then return end

  ec = ec + 1

  -- Modificar la línea de inicio y final
  lines[1] = string.sub(lines[1], 1, sc - 1) .. open .. string.sub(lines[1], sc)
  lines[#lines] = string.sub(lines[#lines], 1, ec) .. close .. string.sub(lines[#lines], ec + 1)

  -- Reemplazar el texto seleccionado
  vim.fn.setline(sl, lines)
end

-- Retorna el módulo
return M
