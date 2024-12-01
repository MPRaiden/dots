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
  vim.api.nvim_set_hl(0, 'StatusLine', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#4c4c4c' })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none', fg = '#4c4c4c' })
  vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#161a2e' })
end

return {
  {
    'tjdevries/colorbuddy.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      Color 'gruvbuddy'
    end,
  },
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'main', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = true,
        enable = {
          terminal = true,
        },
        styles = {
          bold = false,
          transparency = true,
        },
      }
      Color 'rose-pine'
    end,
  },
}
