function Color(color)
  vim.cmd.colorscheme(color)

  -- custom highlights
  vim.api.nvim_set_hl(0, 'Normal', { bg = '#181f2b' })
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
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      Color 'gruvbuddy'
      if vim.g.neovide then
        vim.g.neovide_padding_top = 30
        vim.g.neovide_hide_mouse_when_typing = true
      end
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    priority = 1000,
    lazy = false,
    config = function()
      require('rose-pine').setup {
        variant = 'main', -- main, moon, dawn
        styles = {
          bold = false,
          italic = false,
        },
      }
      vim.cmd.colorscheme 'rose-pine'
      if vim.g.neovide then
        vim.g.neovide_padding_top = 30
      end
    end,
  },
}
