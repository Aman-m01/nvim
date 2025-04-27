return {
  {
   -- this helps with ssh tunneling and copying to clipboard
   'ojroques/vim-oscyank',
  },
  {
    -- get plugins
    'tpope/vim-fugitive'
  },
  {
    -- show CSS colors
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({})
    end
    },

}
