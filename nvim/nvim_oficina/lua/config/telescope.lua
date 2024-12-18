-- ~/.config/nvim/lua/plugins/telescope.lua
require('telescope').setup {
  extensions = {
    live_grep_args = {
      prompt_title = 'Live Grep Args',
      prompt_prefix = 'Args> ',
    },
  }
}
