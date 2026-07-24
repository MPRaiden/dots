vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  flavour = 'macchiato', -- latte, frappe, macchiato, mocha
  transparent_background = true, -- disables setting the background color.
  float = {
    transparent = true, -- enable transparent floating windows
    solid = true, -- use solid styling for floating windows, see |winborder|
  },
}

-- setup must be called before loading
vim.cmd.colorscheme 'catppuccin-nvim'
