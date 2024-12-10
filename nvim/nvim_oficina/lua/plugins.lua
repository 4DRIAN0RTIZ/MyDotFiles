-- ~/.config/nvim/lua/config/plugins.lua
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use 'nanotee/sqls.nvim'
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use "lukas-reineke/indent-blankline.nvim"
  use { "akinsho/toggleterm.nvim" }
  use "CopilotC-Nvim/CopilotChat.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "weirongxu/plantuml-previewer.vim"
  use "tyru/open-browser.vim"
  use "wuelnerdotexe/vim-astro"
  use "jackMort/ChatGPT.nvim"
  use "nvim-lua/plenary.nvim"
  use "MunifTanjim/nui.nvim"
  use { "zbirenbaum/copilot.lua" }
  -- use "github/copilot.vim"
  -- use "leafOfTree/vim-matchtag"
  use "sainnhe/gruvbox-material"
  use "morhetz/gruvbox"
  use { "folke/tokyonight.nvim", branch = "main" }
  use "dracula/vim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "williamboman/nvim-lsp-installer"
--  use "mfussenegger/nvim-dap"
--  use "rcarriga/nvim-dap-ui"
  use "neovim/nvim-lspconfig"
  use "nvim-neotest/nvim-nio"
  use "lewis6991/gitsigns.nvim"
  use "StanAngeloff/php.vim"
  use "folke/which-key.nvim"
  use "folke/trouble.nvim"
  use "nvim-tree/nvim-web-devicons"
  use "rcarriga/nvim-notify"
  use "folke/noice.nvim"
--  use "tpope/vim-dadbod"
--  use "kristijanhusak/vim-dadbod-ui"
-- use "kristijanhusak/vim-dadbod-completion"
  use "KabbAmine/vCoolor.vim"
  use "nvim-telescope/telescope.nvim"
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  use { "nvim-telescope/telescope-live-grep-args.nvim", branch = "master" }
  use { "neoclide/coc.nvim", branch = "release" }
  use { "neoclide/coc-prettier", run = "yarn install --frozen-lockfile" }
  use "mattn/emmet-vim"
  use "mhartington/formatter.nvim"
  use "sheerun/vim-polyglot"
  -- use "hrsh7th/vim-vsnip"
  -- use "hrsh7th/vim-vsnip-integ"
  use "tpope/vim-commentary"
  use "alvan/vim-closetag"
  use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }
  -- use "vim-airline/vim-airline"
  -- use "vim-airline/vim-airline-themes"
  use "nvim-tree/nvim-tree.lua"
  use "othree/html5.vim"
  use "bluz71/vim-moonfly-colors"
  use "sindrets/diffview.nvim"
  use "folke/todo-comments.nvim"
  -- use "Exafunction/codeium.vim"
  use "rafi/awesome-vim-colorschemes"
  use "samharju/synthweave.nvim"
  use "Glench/Vim-Jinja2-Syntax"
  use "stevearc/aerial.nvim"
  use "marko-cerovac/material.nvim"
  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }
  use { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = {
          enable = true,
        },
      }
    end
  }
end)
