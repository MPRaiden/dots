function Color(color)
  if vim.g.neovide then
    vim.g.neovide_padding_top = 20
  end

  vim.cmd.colorscheme(color)

  -- Your custom highlights
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
    'navarasu/onedark.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'deep',
        code_style = {
          comments = 'none',
        },
      }

      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    priority = 1000,
    lazy = false, -- fixed typo: was "layy"
    config = function()
      require('rose-pine').setup {
        variant = 'auto',
        styles = {
          bold = false,
          italic = false,
        },
      }

      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end

      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      --style = 'night', -- this doesnt work
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
        vim.g.neovide_padding_top = 30
        vim.g.neovide_hide_mouse_when_typing = true
      end

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    'tjdevries/colorbuddy.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end

      Color 'gruvbuddy'
    end,
  },
  {
    'Tsuzat/NeoSolarized.nvim',
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end
      vim.cmd [[ colorscheme NeoSolarized ]]
    end,
  },
}
