vim.pack.add {
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  { src = 'https://github.com/folke/tokyonight.nvim', name = 'tokyonight' },
}

require('catppuccin').setup {
  flavour = 'latte',
  transparent_background = true, -- disables setting the background color.
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

require('tokyonight').setup {
  style = 'night',
  transparent = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    sidebars = 'dark', -- style for sidebars, see below
    floats = 'normal', -- style for floating windows
  },
}

local active_mode

local function update_colorscheme()
  local appearance = vim.system({ 'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme' }, { text = true }):wait()
  local mode = appearance.code == 0 and appearance.stdout:match 'dark' and 'dark' or 'light'

  if mode == active_mode then
    return
  end

  active_mode = mode
  vim.o.background = mode
  vim.cmd.colorscheme(mode == 'dark' and 'tokyonight-night' or 'catppuccin-latte')
end

update_colorscheme()

vim.api.nvim_create_autocmd({ 'FocusGained', 'VimResume' }, {
  group = vim.api.nvim_create_augroup('system-colorscheme', { clear = true }),
  callback = update_colorscheme,
})
