return {
  'arnamak/stay-centered.nvim',
  lazy = false,
  opts = {
    -- filetypes to skip centering (use :lua print(vim.bo.filetype) to check)
    skip_filetypes = {
      'neo-tree',
      'TelescopePrompt',
      'toggleterm',
      'noice',
    },
    -- enabled by default
    enabled = true,
    -- allows scroll commands (C-e, C-y) to move without forcing center
    allow_scroll_move = true,
    -- disables on mouse click for natural selection
    disable_on_mouse = true,
  },
  keys = {
    {
      'sc',
      function() require('stay-centered').toggle() end,
      desc = 'Toggle stay-centered',
    },
  },
}
