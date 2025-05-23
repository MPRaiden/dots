function Color(color)
  if vim.g.neovide then
    vim.g.neovide_padding_top = 20
  end
  vim.o.termguicolors = true -- Ensure true color support
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = '#1d2021', fg = '#ebdbb2' }) -- Gruvbox dark grey background and foreground
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1d2021' })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#1d2021' })
  vim.api.nvim_set_hl(0, 'CmpItemMenu', { bg = '#1d2021' })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1d2021' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#1d2021' })
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#1d2021' })
  vim.api.nvim_set_hl(0, 'TroubleNormal', { bg = '#1d2021' })
  vim.api.nvim_set_hl(0, 'WhichKeyNormal', { bg = '#1d2021' })
  vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#4c4c4c' })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none', fg = '#4c4c4c' })
  vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#161a2e' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#1790eb', bg = 'none' })
end

return {
  {
    'tjdevries/colorbuddy.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      Color 'gruvbuddy'
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  {
    'rose-pine/neovim',
    enabled = false,
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      Color 'gruvbox'
      vim.o.background = 'dark'
    end,
  },
}
