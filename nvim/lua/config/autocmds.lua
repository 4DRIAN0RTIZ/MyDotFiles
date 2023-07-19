-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Disable autoformat for lua files

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    -- Disable spell for markdown files
    vim.opt_local.spell = false
    vim.g.markdown_recommended_style = 0
    -- Set default theme
    vim.cmd("setlocal spell spelllang=es")
  end,
})
