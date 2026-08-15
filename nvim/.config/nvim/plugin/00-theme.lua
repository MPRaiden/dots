-- vim.pack.ad-- Using vim.pack
-- vim.pack.add {
--   'https://github.com/navarasu/onedark.nvim',
-- }
-- require('onedark').setup {
--   style = 'dark',
--   transparent = true,
-- }
-- require('onedark').load()

vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }

require('tokyonight').setup {
  style = 'night',
  transparent = true,
  styles = {
    floats = 'transparent',
    sidebars = 'transparent',
    keywords = {
      italic = false,
    },
  },
}

vim.cmd 'colorscheme tokyonight'
