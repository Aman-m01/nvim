return {
  {
    "nvzone/volt"
  },
  {
    "nvzone/floaterm",
    dependencies = { "nvzone/volt" },
    cmd = "FloatermToggle",
    config = function()
      require('floaterm').setup {
        border = true,
        size = { h = 50, w = 80 },
        mappings = {
          sidebar = nil,
          term = function(buf)
            vim.keymap.set({ "n", "t" }, "<C-p>", function()
              require("floaterm.api").cycle_term_bufs "prev"
            end, { buffer = buf, desc = "Prev Floaterm" })
          end,
        },
        terminals = {
          { name = "Shell" },
          { name = "Dev", cmd = "lazygit" },
        },
      }
    end,
  },
}
