vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }

require('tokyonight').setup {
  style = 'night',
  -- transparent = true,
  styles = {
    floats = 'transparent',
  },
}

-- vim.cmd 'colorscheme tokyonight'

vim.pack.add {
  {
    src = 'https://github.com/rose-pine/neovim',
    name = 'rose-pine',
  },
}
require('rose-pine').setup()
vim.cmd 'colorscheme rose-pine-moon'
