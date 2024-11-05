function ColorMyPencils(color)
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

  -- Additional highlights for Telescope and other UI components
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'WhichKeyNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Pmenu', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TroubleNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'CmpItemMenu', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#4c4c4c' })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = '#000000', fg = '#4c4c4c' })

  if color == 'gruvbuddy' then
    -- Load colorbuddy and set colors
    local colorbuddy = require 'colorbuddy'
    local Color = colorbuddy.Color
    local Group = colorbuddy.Group
    local c = colorbuddy.colors
    local g = colorbuddy.groups
    local s = colorbuddy.styles

    -- Define colors
    Color.new('white', '#f2e5bc')
    Color.new('red', '#cc6666')
    Color.new('pink', '#fef601')
    Color.new('green', '#99cc99')
    Color.new('yellow', '#f8fe7a')
    Color.new('blue', '#81a2be')
    Color.new('aqua', '#8ec07c')
    Color.new('cyan', '#8abeb7')
    Color.new('purple', '#8e6fbd')
    Color.new('violet', '#b294bb')
    Color.new('orange', '#de935f')
    Color.new('brown', '#a3685a')
    Color.new('seagreen', '#698b69')
    Color.new('turquoise', '#698b69')
    local background_string = '#000000'
    Color.new('background', background_string)
    Color.new('gray0', background_string)

    -- Define groups with colors
    --Group.new('Normal', c.white, c.gray0)
    --Group.new('@constant', c.orange, nil, s.none)
    -- Group.new('@function', c.yellow, nil, s.none)
    -- Group.new('@function.bracket', g.Normal, g.Normal)
    -- Group.new('@keyword', c.violet, nil, s.none)
    -- Group.new('@keyword.faded', g.NonText.fg:light(), nil, s.none)
    -- Group.new('@property', c.blue)
    -- Group.new('@variable', c.white, nil)
    -- Group.new('@variable.builtin', c.purple:light():light(), g.Normal)
    -- Group.new('@function.call.lua', c.blue:dark(), nil, nil)
  end
end

return {
  {
    'tjdevries/colorbuddy.nvim',
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      -- Apply the gruvbuddy theme
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
        styles = {
          italic = false,
          sidebars = 'dark',
          floats = 'dark',
        },
      }
      ColorMyPencils 'tokyonight'
    end,
  },
}
