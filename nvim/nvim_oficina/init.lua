_G.vim = vim
-- Load plugin settings
require('settings')

-- Configuración básica
local function configure_basic()
  vim.opt.signcolumn = "no"
  vim.opt.shell = "sh"
  vim.g.mapleader = " "
  vim.opt.clipboard = "unnamedplus"
  vim.opt.shiftwidth = 2
  vim.opt.number = true
  vim.opt.mouse = "a"
  vim.opt.cursorline = true
  vim.cmd("syntax enable")
  vim.opt.showcmd = false
  vim.opt.encoding = "UTF-8"
  vim.opt.showmatch = true
  vim.opt.relativenumber = true
  vim.opt.showmode = false
  vim.g.php_sql_query = 1
  vim.g.php_htmlInStrings = 1
  vim.g.codeium_disable_bindings = 1
  vim.opt.splitright = true
  vim.opt.maxmempattern = 200000
  vim.opt.fillchars = { eob = " " }
end

-- Configuración de Blade
-- local function configure_blade()
--   vim.g.blade_custom_directives = { 'datetime', 'javascript' }
--   vim.g.blade_custom_directives_pairs = {
--     markdown = 'endmarkdown',
--     cache = 'endcache'
--   }
-- end
local function configure_dadbod()
  -- Configuración de Dadbod
  vim.g.db_ui_env_variable_url = 'sqlserver://osador:Os%40dor%24%40192.168.0.3/Entrega'
  vim.g.db_ui_env_variable_name = 'ctSystem_PBA'
end

-- Configuración de NvimTree
local function configure_nvimtree()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

-- Configuración del tema
local function configure_theme()
  -- Configurar tema
  vim.opt.termguicolors = true
end

-- Configuración de Closetag
local function configure_closetag()
  vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml'
  vim.g.closetag_xhtml_filenames = '*.xhtml,*.jsx'
  vim.g.closetag_filetypes = 'html,xhtml,phtml'
  vim.g.closetag_xhtml_filetypes = 'xhtml,jsx'
  vim.g.closetag_emptyTags_caseSensitive = 1
  vim.g.closetag_regions = {
    ['typescript.tsx'] = 'jsxRegion,tsxRegion',
    ['javascript.jsx'] = 'jsxRegion',
    ['typescriptreact'] = 'jsxRegion,tsxRegion',
    ['javascriptreact'] = 'jsxRegion'
  }
  vim.g.closetag_close_shortcut = '<leader>>'
end

-- Autocommands
local function configure_autocommands()
  -- Configurar colorcolumn en mensajes de commit
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
      vim.opt_local.colorcolumn = "79"
    end
  })

  -- Desactivar búsqueda resaltada después de buscar
  vim.api.nvim_create_autocmd("CmdlineEnter", {
    pattern = "/",
    callback = function()
      vim.cmd("set nohlsearch")
    end
  })
end

-- Funciones de utilidad
local function utility_functions()
  local function insert_code()
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line_number - 1, line_number - 1, false, {
      '  if ($login_v == "osador") $login_v = "hdorantes";'
    })
  end

  local function print_r()
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line_number - 1, line_number - 1, false, {
      'echo "<pre>";',
      'print_r($_POST);',
      'echo "</pre>";'
    })
  end

  local function remove_print_r()
    local pattern = {
      'echo "<pre>";',
      'print_r($_POST);',
      'echo "</pre>";'
    }

    for _, value in ipairs(pattern) do
      vim.cmd("g/".. value:gsub('/', '\\/') .."/d")
    end
  end

  local function insert_sql_echo()
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line_number - 1, line_number - 1, false, {
      'echo $sql; exit;'
    })
  end

  local function remove_sql_echo()
    local pattern = {
      'echo $sql; exit;'
    }

    for _, value in ipairs(pattern) do
      vim.cmd("g/".. value:gsub('/', '\\/') .."/d")
    end
  end

  local function open_floating_window(content)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local opts = {
      style = "minimal",
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col
    }

    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end

  -- Función que busca el patron "file_put_content" y lo elimina
  local function remove_file_put_content()
    local pattern = "file_put_contents("
    vim.cmd("g/".. pattern:gsub('/', '\\/') .."/d")
  end

  local function sql_query()
    local line = vim.fn.getline(".")
    if vim.fn.mode() == "v" then
      line = table.concat(vim.fn.getline("'<", "'>"), " ")
    end

    if line == "" or line == nil then
      print("No se ha seleccionado ninguna consulta SQL.")
      return
    end

    line = line:gsub("= (%w+)", "= '%1'")
    local path = "/home/neandertech/sqlCommands/sqlQuery.sh"
    local result = vim.fn.system(path .. " \"" .. line .. "\"")
    open_floating_window(result)
  end

  _G.remove_file_put_content = remove_file_put_content
  _G.sql_query = sql_query
  _G.remove_sql_echo = remove_sql_echo
  _G.insert_sql_echo = insert_sql_echo
  _G.remove_print_r = remove_print_r
  _G.print_r = print_r
  _G.insert_code = insert_code
end

-- Configuración de identación
local function configure_indentation()
  vim.opt.autoindent = true
  vim.cmd("filetype plugin indent on")
end

-- venn.nvim: enable or disable keymappings
local function configure_venn()
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.api.nvim_buf_del_keymap(0, "n", "J")
        vim.api.nvim_buf_del_keymap(0, "n", "K")
        vim.api.nvim_buf_del_keymap(0, "n", "L")
        vim.api.nvim_buf_del_keymap(0, "n", "H")
        vim.api.nvim_buf_del_keymap(0, "v", "f")
        vim.b.venn_enabled = nil
    end
end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})

-- Ejecución de las configuraciones
configure_basic()
-- configure_blade()
configure_dadbod()
configure_nvimtree()
configure_theme()
configure_closetag()
configure_autocommands()
utility_functions()
configure_indentation()
configure_venn()
