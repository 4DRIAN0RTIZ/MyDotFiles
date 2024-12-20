local highlight = {
    "GruvboxRed",
    "GruvboxGray",
    "GruvboxBlue",
    "GruvboxGreen",
    "GruvboxAqua",
    "GruvboxYellow",
    "GruvboxPurple",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "GruvboxRed", { fg = "#fb4934" }) -- Gruvbox Red
    vim.api.nvim_set_hl(0, "GruvboxGray", { fg = "#928374" }) -- Gruvbox Gray
    vim.api.nvim_set_hl(0, "GruvboxBlue", { fg = "#83a598" }) -- Gruvbox Blue
    vim.api.nvim_set_hl(0, "GruvboxGreen", { fg = "#b8bb26" }) -- Gruvbox Green
    vim.api.nvim_set_hl(0, "GruvboxAqua", { fg = "#8ec07c" }) -- Gruvbox Aqua
    vim.api.nvim_set_hl(0, "GruvboxYellow", { fg = "#fabd2f" }) -- Gruvbox Yellow
    vim.api.nvim_set_hl(0, "GruvboxPurple", { fg = "#d3869b" }) -- Gruvbox Purple
end)

require("ibl").setup {
    indent = { highlight = highlight },
    exclude = {
        filetypes = { "txt" },
    },
}

