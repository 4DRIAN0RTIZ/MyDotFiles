local highlight = {
    "DarkGray",
    "DimGray",
    "Black",
    "Gray",
    "Charcoal",
    "AshGray",
    "SlateGray",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "DarkGray", { fg = "#A9A9A9" }) -- Dark Gray
    vim.api.nvim_set_hl(0, "DimGray", { fg = "#696969" }) -- Dim Gray
    vim.api.nvim_set_hl(0, "Black", { fg = "#000000" }) -- Black
    vim.api.nvim_set_hl(0, "Gray", { fg = "#808080" }) -- Gray
    vim.api.nvim_set_hl(0, "Charcoal", { fg = "#36454F" }) -- Charcoal
    vim.api.nvim_set_hl(0, "AshGray", { fg = "#B2BEB5" }) -- Ash Gray
    vim.api.nvim_set_hl(0, "SlateGray", { fg = "#708090" }) -- Slate Gray
end)

require("ibl").setup { indent = { highlight = highlight } }
