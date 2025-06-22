return {
  -- Original themes
  { "folke/tokyonight.nvim" },
  { "shaunsingh/nord.nvim" },
  { "olimorris/onedarkpro.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim" },
  { "ellisonleao/gruvbox.nvim" },

  -- Additional popular themes
  { "rose-pine/neovim", name = "rose-pine" },
  { "EdenEast/nightfox.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "sainnhe/everforest" },
  { "sainnhe/sonokai" },
  { "navarasu/onedark.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "marko-cerovac/material.nvim" },
  { "bluz71/vim-nightfly-colors", name = "nightfly" },
  { "bluz71/vim-moonfly-colors", name = "moonfly" },
  { "rmehri01/onenord.nvim" },
  { "Shatur/neovim-ayu" },
  { "cpea2506/one_monokai.nvim" },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "│", right = "│" },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
