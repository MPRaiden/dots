-- Define the ColorMyPencils function to apply highlights and transparency
function ColorMyPencils(color)
  vim.cmd.colorscheme(color)

  -- sets transparency (terminal color) for gruvbuddy (tokyonight can do without)
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })

  -- Additional highlights for Telescope and other UI components
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'WhichKeyNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'Pmenu', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = '#000000', fg = '#4c4c4c' })
end

-- tokyonight
return {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require('tokyonight').setup {
  --       style = 'night',
  --       transparent = true,
  --       terminal_colors = true,
  --       styles = {
  --         --comments = { fg = '#c678dd', italic = true }, -- Make comments more visible
  --         keywords = { italic = false },
  --         sidebars = 'dark',
  --         floats = 'dark',
  --       },
  --     }
  --     ColorMyPencils 'tokyonight'
  --   end,
  -- },

  -- gruvbuddy
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

      require('colorbuddy').colorscheme 'gruvbuddy'

      -- Custom color definitions and background
      Color.new('background', '#111111')
      Color.new('gray0', '#111111')
      --Color.new('brightComment', '#c678dd') -- Custom color for brighter comments

      -- Group settings for various syntax elements
      Group.new('Normal', c.white, c.gray0)
      Group.new('@constant', c.orange, nil, s.none)
      Group.new('@function', c.yellow, nil, s.none)
      Group.new('@function.bracket', g.Normal, g.Normal)
      Group.new('@keyword', c.violet, nil, s.none)
      Group.new('@property', c.blue)
      Group.new('@variable', c.white, nil)
      Group.new('@variable.builtin', c.purple:light():light(), g.Normal)

      -- Apply theme
      ColorMyPencils 'gruvbuddy'
    end,
  },
}
