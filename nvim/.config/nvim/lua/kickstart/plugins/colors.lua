-- This file is pure pain
--
-- Centralized function to set highlights and colors
local function ColorMyPencils(color)
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
    'TelescopePromptTitle',
    'WhichKeyFloat', -- Which-Key background
    'WhichKeyNormal',
    'HarpoonWindow', -- Harpoon window background
    'HarpoonBorder', -- Harpoon border
    'HarpoonCurrentFile',
    'SignColumn', -- Line numbers/sign column
    'NotifyBackground', -- To handle Notify background warning
  }

  -- Apply transparency to all groups
  for _, group in ipairs(highlight_groups) do
    if group == 'NotifyBackground' then
      vim.api.nvim_set_hl(0, group, { bg = '#000000' }) -- NOTE: This if else is needed to avoid NotifyBackground warning
    else
      vim.api.nvim_set_hl(0, group, { bg = 'none' })
    end
  end
end

-- Theme setup helper function
local function setup_theme(theme_name, options)
  require(theme_name).setup(vim.tbl_extend('force', {
    transparent = true,
    terminal_colors = false,
    styles = {
      sidebars = 'dark',
      floats = 'dark',
    },
  }, options or {}))
end

-- Color schemes
return {
  {
    'folke/tokyonight.nvim',
    config = function()
      setup_theme('tokyonight', { disable_background = true, style = 'night', styles = { italic = false } })
      ColorMyPencils 'tokyonight'
    end,
  },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   config = function()
  --     setup_theme('rose-pine', { disable_background = true, style = 'main', styles = { italic = false } })
  --     ColorMyPencils 'rose-pine'
  --   end,
  -- },
}

-- vim: ts=2 sts=2 sw=2 et
