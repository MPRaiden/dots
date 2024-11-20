function ColorMyPencils(color)
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' }) -- Inactive windows
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

  -- Additional highlights for Telescope and other UI components
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'WhichKeyNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Pmenu', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TroubleNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'CmpItemMenu', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'StatusLine', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#4c4c4c' })

  if color == 'gruvbuddy' then
    vim.api.nvim_set_hl(0, 'LineNr', { bg = '#000000', fg = '#4c4c4c' })
    vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#161a2e' })
  end
end

return {
  {
    'tjdevries/colorbuddy.nvim',
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      ColorMyPencils 'gruvbuddy'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    enabled = false,
    opts = {},
    config = function()
      require('tokyonight').setup {
        style = 'night',
        transparent = true,
        terminal_colors = true,
      }
      ColorMyPencils 'tokyonight'
    end,
  },
}
