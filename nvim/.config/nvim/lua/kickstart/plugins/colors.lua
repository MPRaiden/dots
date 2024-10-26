-- This file is pure pain
--
--
-- Centralized function to set highlights and colors
local function ColorMyPencils(color)
  color = color or 'tokyonight' -- Default to tokyonight
  vim.cmd.colorscheme(color)

  -- Define highlight groups to make transparent
  local highlight_groups = {
    'Normal', -- Main editor background
    'NormalFloat', -- Floating windows
    'TelescopeNormal', -- Telescope background
    'TelescopeBorder', -- Telescope borders
    'TelescopePromptNormal',
    'TelescopePromptBorder',
    'TelescopeResultsNormal',
    'TelescopeResultsBorder',
    'TelescopePreviewNormal',
    'TelescopePreviewBorder',
    'WhichKeyFloat', -- Which-Key background
    'HarpoonWindow', -- Harpoon window background
    'HarpoonBorder', -- Harpoon border
    'SignColumn', -- Line numbers/sign column
    'NotifyBackground', -- To handle Notify background warning
  }

  -- Apply transparency to all groups
  for _, group in ipairs(highlight_groups) do
    if group == 'NotifyBackground' then
      -- Set a default background for NotifyBackground to avoid warnings
      vim.api.nvim_set_hl(0, group, { bg = '#000000' }) -- Example color
    else
      vim.api.nvim_set_hl(0, group, { bg = 'none' })
    end
  end
end

-- Theme setup helper function
local function setup_theme(theme_name, options)
  require(theme_name).setup(vim.tbl_extend('force', {
    transparent = true,
    terminal_colors = true,
    styles = {
      sidebars = 'dark',
      floats = 'dark',
    },
  }, options or {}))
end

-- Choose your theme here
local current_theme = 'tokyonight' -- Default theme; change to 'everforest' or others as needed

-- Color schemes
return {
  {
    'folke/tokyonight.nvim',
    config = function()
      setup_theme('tokyonight', { disable_background = true, style = 'night', styles = { italic = false } })
      ColorMyPencils(current_theme)
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      setup_theme('rose-pine', { disable_background = true, style = 'main', styles = { italic = false } })
      ColorMyPencils(current_theme)
    end,
  },
  {
    'neanias/everforest-nvim',
    name = 'everforest',
    config = function()
      require('everforest').setup {
        background = 'hard', -- Choose 'hard' for darker tones
        contrast = 'soft', -- Set contrast to dark
        transparent_background_level = 2, -- Customize transparency level
      }
      vim.cmd.colorscheme 'everforest'
      ColorMyPencils 'everforest'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
