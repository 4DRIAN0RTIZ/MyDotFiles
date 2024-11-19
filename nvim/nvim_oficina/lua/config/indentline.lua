local highlight = {
    "DarkRed",
    "DarkGray",
    "DarkBlue",
    "DarkGreen",
    "DarkSlateGray",
    "DarkOliveGreen",
    "DarkMagenta",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "DarkRed", { fg = "#8B0000" }) -- Dark Red
    vim.api.nvim_set_hl(0, "DarkGray", { fg = "#A9A9A9" }) -- Dark Gray
    vim.api.nvim_set_hl(0, "DarkBlue", { fg = "#00008B" }) -- Dark Blue
    vim.api.nvim_set_hl(0, "DarkGreen", { fg = "#006400" }) -- Dark Green
    vim.api.nvim_set_hl(0, "DarkSlateGray", { fg = "#2F4F4F" }) -- Dark Slate Gray
    vim.api.nvim_set_hl(0, "DarkOliveGreen", { fg = "#556B2F" }) -- Dark Olive Green
    vim.api.nvim_set_hl(0, "DarkMagenta", { fg = "#8B008B" }) -- Dark Magenta
end)

require("ibl").setup { indent = { highlight = highlight } }
