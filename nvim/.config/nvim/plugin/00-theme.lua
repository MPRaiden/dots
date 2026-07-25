vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  flavour = 'auto', -- latte, frappe, macchiato, mocha
  -- sets the flavour based on system being dark/light
  background = {
    light = 'latte',
    dark = 'macchiato',
  },
  transparent_background = true,
  float = {
    transparent = true, -- enable transparent floating windows
    solid = true, -- use solid styling for floating windows, see |winborder|
  },
}

vim.cmd.colorscheme 'catppuccin-nvim'
