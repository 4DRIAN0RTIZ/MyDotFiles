-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- CONFIGURATION KEYMAPS
vim.api.nvim_set_keymap("n", "<C-p>", ":bnext<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-o>", ":bprevious<CR>", { silent = true })

-- Neotree config
vim.api.nvim_set_keymap("n", "<F2>", ":Neotree toggle position=right<CR>", { silent = true })
