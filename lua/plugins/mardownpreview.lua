return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Changed from true to false as recommended
  ft = { "markdown", "typst", "latex", "yaml", "html" }, -- Added filetype loading
  -- If you use blink.cmp for completion, uncomment the next line:
  -- dependencies = { "saghen/blink.cmp" },
  config = function()
    require("markview").setup({
      preview = {
        icon_provider = "internal", -- or "mini" or "devicons"
      },
      -- Add further customization here as needed
    })
  end,
  keys = {
    {
      "<leader>mp",
      function()
        vim.cmd("Markview preview")
      end,
      desc = "Markdown Preview (Markview)",
    },
  },
}