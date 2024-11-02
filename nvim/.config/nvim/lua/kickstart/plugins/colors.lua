-- Define the ColorMyPencils function to apply highlights and transparency
function ColorMyPencils(color)
  local success, _ = pcall(vim.cmd.colorscheme, color)
  if not success then
    vim.notify('Colorscheme ' .. color .. ' not found!', vim.log.levels.WARN)
    return
  end

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = '#000000' })

  vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'WhichKeyNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Pmenu', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = '#000000', fg = '#4c4c4c' })
  vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#4c4c4c' })
end

-- Plugin setup with the new color scheme
return {
  {
    'tjdevries/colorbuddy.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local colorbuddy = require 'colorbuddy'
      local Color = colorbuddy.Color
      local Group = colorbuddy.Group
      local c = colorbuddy.colors
      local g = colorbuddy.groups
      local s = colorbuddy.styles

      -- Load gruvbuddy colorscheme
      require('colorbuddy').colorscheme 'gruvbuddy'

      -- Custom color definitions
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

      -- Background color setup
      local background_string = '#111111'
      Color.new('background', background_string)
      Color.new('gray0', background_string)

      -- Group settings for various syntax elements
      Group.new('Normal', c.white, c.gray0)
      Group.new('@constant', c.orange, nil, s.none)
      Group.new('@function', c.yellow, nil, s.none)
      Group.new('@function.bracket', g.Normal, g.Normal)
      Group.new('@keyword', c.violet, nil, s.none)
      Group.new('@keyword.faded', g.nontext.fg:light(), nil, s.none)
      Group.new('@property', c.blue)
      Group.new('@variable', c.white, nil)
      Group.new('@variable.builtin', c.purple:light():light(), g.Normal)

      -- Lua specific function call color
      Group.new('@function.call.lua', c.blue:dark(), nil, nil)

      -- Apply transparency and highlights
      ColorMyPencils 'gruvbuddy'
    end,
  },
}
