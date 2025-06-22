return {
  -- ── Colour-schemes ─────────────────────────────────────────────────────────
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  { "shaunsingh/nord.nvim" },
  { "olimorris/onedarkpro.nvim", opts = true },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
  { "rebelot/kanagawa.nvim", opts = true },
  { "ellisonleao/gruvbox.nvim", opts = true },
  { "rose-pine/neovim", name = "rose-pine", opts = true },
  { "EdenEast/nightfox.nvim", opts = true },
  { "Mofiqul/dracula.nvim", opts = true },
  { "projekt0n/github-nvim-theme", opts = true },
  { "sainnhe/everforest", opts = true },
  { "sainnhe/sonokai", opts = true },
  { "navarasu/onedark.nvim", opts = true },
  { "Mofiqul/vscode.nvim", opts = true },
  { "marko-cerovac/material.nvim", opts = true },
  { "bluz71/vim-nightfly-colors", name = "nightfly", opts = true },
  { "bluz71/vim-moonfly-colors", name = "moonfly", opts = true },
  { "rmehri01/onenord.nvim", opts = true },
  { "Shatur/neovim-ayu", opts = true },
  { "cpea2506/one_monokai.nvim", opts = true },

  -- ── UI / status-line ──────────────────────────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = function()
      return {
        options = {
          theme = vim.g.colors_name or "tokyonight",
          icons_enabled = true,
          section_separators   = { left = "", right = "" },
          component_separators = { left = "│", right = "│" },
        },
      }
    end,
  },

  -- ── Fuzzy finder ───────────────────────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
