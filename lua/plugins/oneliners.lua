return {
  -- zen mode
  {
  "folke/zen-mode.nvim",
  opts = { },
},
-- neoscroll 
{
  "karb94/neoscroll.nvim",
  opts = {
    mappings = {
      '<C-u>', '<C-d>',
      '<C-b>', '<C-f>',
      -- We will override <C-y> and <C-e>, so don’t include them
      'zt', 'zz', 'zb',
    },
    hide_cursor = true,
    stop_eof = true,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    duration_multiplier = 1.0,
    easing = 'linear',
    pre_hook = nil,
    post_hook = nil,
    performance_mode = false,
    ignored_events = { 'WinScrolled', 'CursorMoved' },
  },
  config = function()
    local neoscroll = require("neoscroll")
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local modes = { "n", "v", "x" }

    -- Custom mappings: one-line scroll
    for _, mode in ipairs(modes) do
      map(mode, "<C-k>", function() neoscroll.scroll(-0.1, { move_cursor = true, duration = 100 }) end, opts)
      map(mode, "<C-j>", function() neoscroll.scroll(0.1, { move_cursor = true, duration = 100 }) end, opts)
    end
  end,
}

, 
  {
    -- 🔗 Copy over SSH with OSC52 (useful for remote development)
    "ojroques/vim-oscyank",
    event = "VeryLazy", -- load when needed, not at startup
    config = function()
      vim.g.oscyank_max_length = 100000
    end,
  },

  {
    -- 🧠 Git commands like :G, :Gstatus, :Gdiff
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Glog", "Gstatus" },
  },

  {
    -- 🎨 Highlight hex/rgb/hsl CSS color codes inline
    "brenoprata10/nvim-highlight-colors",
    ft = { "css", "scss", "html", "javascript", "typescript", "lua" },
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background", -- options: 'background', 'foreground', 'first_column'
        enable_named_colors = true,
        enable_tailwind = true,
      })
    end,
  },

{
  -- supermaven code completion
  "supermaven-inc/supermaven-nvim",
  event = "VeryLazy",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-l>",     -- Ctrl+l
      },
      ignore_filetypes = { "cpp" },
      color = {
        suggestion_color = "#808080",
        cterm = 244,
      },
      log_level = "info",
      disable_inline_completion = false,
      disable_keymaps = false,
    })
  end,
}
 
}
