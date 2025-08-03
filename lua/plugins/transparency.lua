-- ~/.config/nvim/lua/plugins/transparency.lua
return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  priority = 1000, -- Load early to ensure transparency is applied before other UI elements
  opts = {
    -- Groups to make transparent
    groups = {
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLineNr', 'EndOfBuffer',
    },
    -- Additional groups for specific plugins/features
    extra_groups = {
      -- NeoTree transparency
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeEndOfBuffer",
      
      -- Telescope transparency
      "TelescopeNormal",
      "TelescopeBorder",
      "TelescopePromptBorder",
      "TelescopeResultsBorder",
      "TelescopePreviewBorder",
      
      -- WhichKey transparency
      "WhichKey",
      "WhichKeyFloat",
      
      -- Alpha (dashboard) transparency
      "AlphaShortcut",
      "AlphaHeader",
      "AlphaHeaderLabel",
      "AlphaFooter",
      "AlphaButtons",
      
      -- Notify transparency
      "NotifyBackground",
      
      -- Float windows
      "NormalFloat",
      "FloatBorder",
      
      -- Statusline (if you want it transparent)
      -- "StatusLine",
      -- "StatusLineNC",
      
      -- Tabline (if you want it transparent)
      -- "TabLine",
      -- "TabLineFill",
      -- "TabLineSel",
    },
    -- Exclude these groups from transparency
    exclude_groups = {
      -- Keep cursor line visible
      "CursorLine",
      -- Keep search highlights visible
      "Search",
      "IncSearch",
      -- Keep visual selection visible
      "Visual",
      -- Keep error/warning signs visible
      "DiagnosticError",
      "DiagnosticWarn",
      "DiagnosticInfo",
      "DiagnosticHint",
    },
  },
  config = function(_, opts)
    local transparent = require("transparent")
    transparent.setup(opts)
    
    -- Enable transparency by default
    transparent.clear_prefix("BufferLine")
    transparent.clear_prefix("NeoTree")
    transparent.clear_prefix("lualine")
    
    -- Auto command to maintain transparency
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        transparent.clear_prefix("BufferLine")
        transparent.clear_prefix("NeoTree") 
        transparent.clear_prefix("lualine")
      end,
    })
  end,
  keys = {
    -- Toggle transparency on/off
    { "<leader>ut", "<cmd>TransparentToggle<cr>", desc = "Toggle transparency" },
  },
}