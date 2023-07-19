return {
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown",
    cmd = "MarkdownPreview",
    keys = {
      {
        "<leader>mp",
        function()
          vim.cmd("MarkdownPreview")
        end,
        desc = "Markdown Preview",
      },
    },
  },
}
