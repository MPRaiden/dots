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

  -- Additional highlights for Telescope and other UI components
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

  -- Highlight settings specifically for SQL comments
  vim.api.nvim_set_hl(0, 'sqlComment', { fg = '#c678dd', italic = true }) -- Custom color for SQL comments
end

-- tokyonight setup with comment style for SQL
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
  --         comments = { fg = '#c678dd', italic = true }, -- Make comments more visible
  --         keywords = { italic = false },
  --         sidebars = 'dark',
  --         floats = 'dark',
  --       },
  --     }
  --     ColorMyPencils 'tokyonight'
  --   end,
  -- },

  -- gruvbuddy setup with a distinct SQL comment color
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
      Color.new('brightComment', '#c678dd') -- Custom color for brighter comments

      -- Group settings for various syntax elements
      Group.new('Normal', c.white, c.gray0)
      Group.new('@constant', c.orange, nil, s.none)
      Group.new('@function', c.yellow, nil, s.none)
      Group.new('@function.bracket', g.Normal, g.Normal)
      Group.new('@keyword', c.violet, nil, s.none)
      Group.new('@property', c.blue)
      Group.new('@variable', c.white, nil)
      Group.new('@variable.builtin', c.purple:light():light(), g.Normal)

      -- SQL-specific comment style
      Group.new('sqlComment', c.brightComment, nil, s.italic)

      -- Apply transparency and highlights
      ColorMyPencils 'gruvbuddy'
    end,
  },
}
