-- ~/.config/nvim/lua/plugins/telescope.lua
require('telescope').setup {
  extensions = {
    live_grep_args = {
      prompt_title = 'Live Grep Args',
      prompt_prefix = 'Args> ',
    },
    sqls = {
      show_results_in_split = true,
      prompt_title = 'SQL Query',
      prompt_prefix = 'SQL> '
    }
  }
}
vim.api.nvim_set_keymap('n', ';tq', ':lua require("telescope").extensions.sqls.queries()<CR>', { noremap = true, silent = true })
