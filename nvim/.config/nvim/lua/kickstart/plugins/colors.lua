return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false, -- Enable lazy loading
    config = function()
      -- Set up the colorscheme
      require('rose-pine').setup {
        variant = 'main', -- Options 'main', 'moon', or 'dawn'
        dark_variant = 'main',
        disable_background = true,
        disable_italics = true,
      }
      -- Apply the colorscheme
      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
