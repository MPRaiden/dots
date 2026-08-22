vim.pack.add {
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
}

require('catppuccin').setup {
  flavour = 'auto',
  transparent_background = true, -- disables setting the background color.
  background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
  float = {
    transparent = true, -- enable transparent floating windows
    solid = true, -- use solid styling for floating windows, see |winborder|
  },
  no_italic = true, -- Force no italic
  auto_integrations = true,
  integrations = {
    nvimtree = false,
    mini = {
      enabled = true,
      indentscope_color = '',
    },
  },
}

vim.cmd 'colorscheme catppuccin'
