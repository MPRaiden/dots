function Color(color)
  if vim.g.neovide then
    vim.g.neovide_padding_top = 20
    vim.o.termguicolors = true -- Ensure true color support
    vim.g.neovide_hide_mouse_when_typing = true
  end

  -- Disable italics for gruvbox (only works before loading the colorscheme)
  if color == 'gruvbox' then
    require('gruvbox').setup {
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      bold = false,
    }
  end

  vim.cmd.colorscheme(color)

  if color == 'gruvbox' then
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#1d2021', fg = '#ebdbb2' })
  else
    vim.api.nvim_set_hl(0, 'Normal', { link = 'Normal' })
  end
  -- Your custom highlights
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
    'tjdevries/colorbuddy.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      Color 'gruvbuddy'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      Color 'gruvbox'
      vim.o.background = 'dark'
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end
    end,
  },
  {
    'rose-pine/neovim',
    enabled = true,
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      vim.cmd.colorscheme 'rose-pine'
      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end
    end,
  },
  {
    'navarasu/onedark.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        --style = 'dark',
        code_style = {
          comments = 'none',
        },
      }
      -- Enable theme
      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end
      require('onedark').load()
    end,
  },
}
