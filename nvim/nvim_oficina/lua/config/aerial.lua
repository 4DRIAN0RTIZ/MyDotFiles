-- Configuración ajustada para aerial sin grupos de colores personalizados
require("aerial").setup({
  -- Prioridad de backends preferidos para aerial
  backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

  layout = {
    -- Controla el ancho de la ventana de aerial
    max_width = { 40, 0.3 },
    width = 30,  -- Establece un ancho fijo
    min_width = 20,

    -- Opciones de ventana locales para la ventana de aerial
    win_opts = {
      -- Puedes agregar más opciones si lo deseas
    },

    -- Determina la dirección predeterminada para abrir la ventana de aerial
    default_direction = "left",  -- Siempre abrirá a la izquierda, evitando el modo flotante

    -- Determina dónde se abrirá la ventana de aerial
    placement = "edge",  -- Abre en el borde izquierdo del editor

    -- Ajusta el tamaño de la ventana según el contenido
    resize_to_content = false,  -- Desactiva el cambio automático de tamaño

    -- Preserva la igualdad del tamaño de las ventanas
    preserve_equality = false,
  },

  -- Modo de adjuntar de aerial
  attach_mode = "window",

  -- Eventos automáticos de cierre
  close_automatic_events = {},

  -- Keymaps en la ventana de aerial
  keymaps = {
    ["?"] = "actions.show_help",
    ["<CR>"] = "actions.jump",
    ["o"] = "actions.tree_toggle",
    ["l"] = "actions.tree_open",
    ["h"] = "actions.tree_close",
    ["q"] = "actions.close",
    -- Agrega o modifica keymaps según tus preferencias
  },

  -- Carga perezosa
  lazy_load = true,

  -- Deshabilita aerial en archivos con muchas líneas o tamaño grande
  disable_max_lines = 10000,
  disable_max_size = 2000000,

  -- Filtros de símbolos a mostrar
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },

  -- Modo de resaltado
  highlight_mode = "full_width",

  -- Resalta el símbolo más cercano si el cursor no está exactamente en uno
  highlight_closest = true,

  -- Resalta el símbolo en el buffer fuente cuando el cursor está en la ventana de aerial
  highlight_on_hover = true,

  -- Resalta la línea al saltar a un símbolo
  highlight_on_jump = 300,

  -- Salta automáticamente al símbolo en el buffer fuente cuando el cursor se mueve
  autojump = true,

  -- Define iconos de símbolos
  nerd_font = true,  -- Fuerza el uso de iconos de Nerd Font

  -- Ignora ciertas ventanas y buffers
  ignore = {
    unlisted_buffers = false,
    diff_windows = true,
    filetypes = {},
    buftypes = "special",
    wintypes = "special",
  },

  -- No utilizar el árbol de símbolos para el plegado de código
  manage_folds = false,

  -- Muestra caracteres de dibujo de caja para la jerarquía del árbol
  show_guides = true,

  -- Personaliza los caracteres utilizados cuando show_guides = true
  guides = {
    mid_item = "├─",
    last_item = "└─",
    nested_top = "│ ",
    whitespace = "  ",
  },

  -- Función para sobrescribir los grupos de resaltado (comentada para usar valores predeterminados)
  -- get_highlight = function(symbol, is_icon, is_collapsed)
  --   return "Aerial" .. symbol.kind
  -- end,

  -- Función cuando aerial se adjunta a un buffer
  on_attach = function(bufnr)
    -- Salta hacia adelante/atrás con '{' y '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,

  -- Abre automáticamente aerial al entrar en buffers soportados
  open_automatic = false,

  -- Cierra automáticamente aerial después de saltar a un símbolo
  close_on_select = true,
})

-- Establece un keymap para alternar aerial
vim.keymap.set("n", "<F3>", "<cmd>AerialToggle! left<CR>")
