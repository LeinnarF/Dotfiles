return{
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup({
      render = 'background', -- or 'foreground' or 'virtual'
      enable_tailwind = true,
    })
  end
}
