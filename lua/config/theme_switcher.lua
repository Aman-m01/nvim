local themes = {}

-- Automatically detect available themes
local function get_available_themes()
  local known_themes = {
    "tokyonight",
    "nord",
    "onedarkpro",
    "catppuccin",
    "kanagawa",
    "gruvbox",
    "rose-pine",
    "nightfox",
    "dracula",
    "github-nvim-theme",
    "everforest",
    "sonokai",
    "onedark",
    "vscode",
    "material",
    "nightfly",
    "moonfly",
    "onenord",
    "neovim-ayu",
    "one_monokai"
  }

  local available = {}
  for _, theme in ipairs(known_themes) do
    local path = string.format("colors/%s.vim", theme)
    if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/site/pack/packer/start/" .. theme .. "/" .. path) then
      table.insert(available, theme)
    end
  end

  return available
end

themes = get_available_themes()

-- Apply theme and update lualine
local function apply_theme(theme)
  local ok, _ = pcall(vim.cmd.colorscheme, theme)
  if not ok then
    vim.notify("Colorscheme '" .. theme .. "' not found!", vim.log.levels.ERROR)
    return
  end

  local lualine_ok, lualine = pcall(require, "lualine")
  if lualine_ok then
    lualine.setup({
      options = {
        theme = theme,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "│", right = "│" },
      },
    })
  end
end

-- Picker using telescope
local function pick_theme()
  local ok, telescope = pcall(require, "telescope.builtin")
  if not ok then
    vim.notify("Telescope not found!", vim.log.levels.ERROR)
    return
  end

  local current_theme = vim.g.colors_name or "tokyonight"

  local display_themes = {}
  for _, theme in ipairs(themes) do
    table.insert(display_themes, (theme == current_theme) and ("%s ←"):format(theme) or theme)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Select Color Scheme",
    finder = require("telescope.finders").new_table {
      results = display_themes,
    },
    sorter = require("telescope.config").values.generic_sorter({}),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry().value
        local selected_theme = string.gsub(selection, " ←", "")
        require("telescope.actions").close(prompt_bufnr)
        apply_theme(selected_theme)
      end)
      return true
    end,
  }):find()
end

-- Keybinding
vim.keymap.set("n", "<leader>th", pick_theme, { desc = "Theme Picker" })
