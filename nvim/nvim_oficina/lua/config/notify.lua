-- ~/.config/nvim/lua/plugins/notify.lua
require("notify").setup({
    stages = "slide",
    timeout = 5000,
    renderer = "minimal",
    background_colour = "#000000",
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
    top_down = false,
})
