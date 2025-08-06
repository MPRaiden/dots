function Color(color)
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, 'Normal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'CmpItemMenu', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Pmenu', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TroubleNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'WhichKeyNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#4c4c4c' })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none', fg = '#4c4c4c' })
  vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#161a2e' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#1790eb', bg = 'none' })
end

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    priority = 10000,
    lazy = false,
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        dark_variant = 'moon',
        dim_inactive_windows = false,
        extend_background_behind_borders = false,
        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },
        groups = {},
        highlight_groups = {},
        styles = {
          bold = true,
          italic = false,
        },
        before_highlight = function() end,
      }
      vim.cmd.colorscheme 'rose-pine'

      if vim.g.neovide then
        vim.g.neovide_padding_top = 15
        vim.g.neovide_hide_mouse_when_typing = true
      end
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = true,
    lazy = false,
    priority = 10000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
      },
      sidebars = { 'qf', 'help' },
    },
    config = function()
      if vim.g.neovide then
        vim.g.neovide_padding_top = 15
      end
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    'savq/melange-nvim',
    enabled = false,
    lazy = false,
    priority = 10000,
    config = function()
      if vim.g.neovide then
        vim.g.neovide_padding_top = 15
      end
      vim.cmd.colorscheme 'melange'
    end,
  },
  {
    'tjdevries/colorbuddy.nvim',
    enabled = true,
    lazy = false,
    priority = 10000,
    config = function()
      Color 'gruvbuddy'
    end,
  },
}
