return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰱼  Find Files", ":Telescope find_files<CR>"),
      dashboard.button("r", "󰑃  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "🀣  Config", ":e $MYVIMRC<CR>"),
      dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "󰿅  Quit", ":qa<CR>"),
      dashboard.button("t", "☆   Theme picker", ":lua require('telescope.builtin').colorscheme({enable_preview=true})<CR>"),


    }

    -- Modern gradient-style header with better spacing
    local header = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }

    dashboard.section.header.val = header

    -- Performance optimizations
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Set custom highlight groups for better visuals
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7aa2f7", bold = true })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#9ece6a" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#bb9af7", italic = true })

    -- Optimized lazy stats footer with caching
    local stats_cache = {}
    local cache_timeout = 5000 -- 5 seconds cache

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local current_time = vim.loop.hrtime()

        -- Use cached stats if available and not expired
        if stats_cache.time and (current_time - stats_cache.time) < cache_timeout * 1000000 then
          dashboard.section.footer.val = stats_cache.footer
          return
        end

        local lazy_ok, lazy = pcall(require, "lazy")
        if lazy_ok then
          local stats = lazy.stats()
          local count = math.floor(stats.startuptime * 100) / 100
          local version = vim.version()
          local datetime = os.date("%d-%m-%Y  %H:%M:%S")

          local footer = {
            "⚡ " .. stats.count .. " plugins loaded in " .. count .. " ms",
            "",
            "📅 " .. datetime,
            "",
            "🚀 NeoVim v" .. version.major .. "." .. version.minor .. "." .. version.patch,
          }

          -- Cache the results
          stats_cache.footer = footer
          stats_cache.time = current_time

          dashboard.section.footer.val = footer
          pcall(vim.cmd.AlphaRedraw)
        end
      end,
    })

    -- Optimized layout with better spacing
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 3 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    -- Performance: disable cursorline on alpha buffer
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.foldcolumn = "0"
      end,
    })

    alpha.setup(dashboard.config)
  end,
}
