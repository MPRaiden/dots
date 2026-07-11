vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }

require('tokyonight').setup {
  -- style = 'auto',
  transparent = false,
  plugins = {
    auto = true,
  },
  styles = {
    floats = 'transparent',
  },
}

vim.cmd.colorscheme 'tokyonight'
