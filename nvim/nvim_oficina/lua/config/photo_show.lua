local M = {}

-- Opciones configurables
M.config = {
  term_width = 0.3, -- Tamaño del terminal (ancho como fracción del editor)
  term_height = 0.3, -- Tamaño del terminal (alto como fracción del editor)
  timg_size = "80%", -- Tamaño dentro de timg usando -g
  position = "bottom_right", -- Posición de la ventana (bottom_right, top_left, etc.)
  fixed_image = nil, -- Imagen fija para mostrar
}

local active_win_id = nil

-- Configurar opciones globales
function M.setup(config)
  M.config = vim.tbl_extend("force", M.config, config or {})
end

-- Función para mostrar una imagen fija
function M.show_fixed_image()
  if not M.config.fixed_image then
    vim.notify("No se ha configurado una imagen fija.", vim.log.levels.WARN)
    return
  end
  M.show_image(M.config.fixed_image)
end

-- Función para calcular posición del terminal basado en la configuración
local function calculate_position()
  local editor_width = vim.o.columns
  local editor_height = vim.o.lines
  local term_width = math.floor(editor_width * M.config.term_width)
  local term_height = math.floor(editor_height * M.config.term_height)
  local row, col = 0, 0

  if M.config.position == "center" then
    row = math.floor((editor_height - term_height) / 2)
    col = math.floor((editor_width - term_width) / 2)
  elseif M.config.position == "top_right" then
    row = 0
    col = editor_width - term_width
  elseif M.config.position == "bottom_right" then
    row = editor_height - term_height
    col = editor_width - term_width
  elseif M.config.position == "bottom_left" then
    row = editor_height - term_height
    col = 0
  elseif M.config.position == "top_left" then
    row = 0
    col = 0
  end

  return term_width, term_height, row, col
end

-- Mostrar una imagen en una ventana flotante
function M.show_image(image_path)
  local term_width, term_height, row, col = calculate_position()

  -- Crear un nuevo buffer y ventana flotante
  local bufnr = vim.api.nvim_create_buf(false, true)
  local opts = {
    style = "minimal",
    relative = "editor",
    width = term_width,
    height = term_height,
    row = row,
    col = col,
  }
  local win_id = vim.api.nvim_open_win(bufnr, true, opts)

  -- Ejecutar timg con opciones personalizadas
  vim.fn.termopen("timg -g " .. M.config.timg_size .. " " .. image_path)

  -- Guardar el ID de la ventana activa
  active_win_id = win_id

  -- Asignar una tecla para cerrar la ventana
  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<Cmd>close<CR>", { noremap = true, silent = true })

  -- Configuración opcional del buffer
  vim.api.nvim_buf_set_option(bufnr, "buftype", "terminal")
  vim.api.nvim_buf_set_option(bufnr, "number", false)
  vim.api.nvim_buf_set_option(bufnr, "relativenumber", false)
end

-- Función para cerrar la ventana flotante
function M.close_image_window()
  if active_win_id and vim.api.nvim_win_is_valid(active_win_id) then
    vim.api.nvim_win_close(active_win_id, true)
    active_win_id = nil
  else
    vim.notify("No hay ventana activa del visor.", vim.log.levels.WARN)
  end
end

-- Mostrar una lista de imágenes desde una carpeta
function M.show_folder(folder_path)
  local handle = io.popen("ls -1 " .. folder_path .. "/*.{jpg,png,gif} 2>/dev/null")
  if not handle then
    vim.notify("No se pudo abrir la carpeta: " .. folder_path, vim.log.levels.ERROR)
    return
  end

  local images = {}
  for line in handle:lines() do
    table.insert(images, line)
  end
  handle:close()

  if #images == 0 then
    vim.notify("No se encontraron imágenes en: " .. folder_path, vim.log.levels.WARN)
    return
  end

  local current_index = 1

  -- Mostrar la primera imagen
  M.show_image(images[current_index])

  -- Configurar navegación entre imágenes
  vim.api.nvim_buf_set_keymap(0, "n", "n", "", {
    noremap = true,
    silent = true,
    callback = function()
      current_index = (current_index % #images) + 1
      M.show_image(images[current_index])
    end,
  })
  vim.api.nvim_buf_set_keymap(0, "n", "p", "", {
    noremap = true,
    silent = true,
    callback = function()
      current_index = (current_index - 2) % #images + 1
      M.show_image(images[current_index])
    end,
  })
end

return M
