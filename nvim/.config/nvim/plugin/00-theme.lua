vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }

require('tokyonight').setup {
  -- transparent = true,
  styles = {
    floats = 'transparent',
  },
}

-- vim.cmd 'colorscheme tokyonight-night'

vim.pack.add {
  {
    src = 'https://github.com/rose-pine/neovim',
    name = 'rose-pine',
  },
}
require('rose-pine').setup {
  styles = {
    italic = false,
    transparency = true,
  },
}
vim.cmd 'colorscheme rose-pine'
