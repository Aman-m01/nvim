local themes = {
  "tokyonight",
  "nord",
  "onedark",
  "catppuccin",
  "kanagawa",
  "gruvbox"
}

-- Apply theme and update lualine
local function apply_theme(theme)
  vim.cmd.colorscheme(theme)

  local ok, lualine = pcall(require, "lualine")
  if ok then
    lualine.setup({
      options = {
        theme = theme,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
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

  require("telescope.pickers").new({}, {
    prompt_title = "Select Color Scheme",
    finder = require("telescope.finders").new_table {
      results = themes,
    },
    sorter = require("telescope.config").values.generic_sorter({}),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        apply_theme(selection.value)
      end)
      return true
    end,
  }):find()
end

-- Keybinding
vim.keymap.set("n", "<leader>th", pick_theme, { desc = "Theme Picker" })
