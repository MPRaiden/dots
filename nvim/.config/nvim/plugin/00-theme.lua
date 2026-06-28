vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  transparent_background = true, -- disables setting the background color.
  float = {
    transparent = true, -- enable transparent floating windows
    solid = false, -- use solid styling for floating windows, see |winborder|
  },
  no_italic = true, -- Force no italic
  no_bold = false, -- Force no bold
  auto_integrations = true,
}

-- setup must be called before loading
vim.cmd.colorscheme 'catppuccin-nvim'
