-- This file is pure pain
--
--
-- Centralized function to set highlights and colors
local function ColorMyPencils(color)
  color = color or 'gruvbox' -- Default to Gruvbox
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
      comments = { italic = false },
      keywords = { italic = false },
      sidebars = 'dark',
      floats = 'dark',
    },
  }, options or {}))
end

-- Choose your theme here
local current_theme = 'tokyonight' -- Change this to "rose-pine" or "tokyonight" as needed (all colors look great with 'rose-pine' set as wezterm color, same with no color set there as well, only problem is when you have no color for wezterm and select rose-pine as a color for nvim, in that case the main editor looks fine but all the plugins, things like telescope, undotree, which key etc do not match the color of the main editor and that annoys me as hell)

-- Color schemes
return {
  -- Gruvbox theme from Morhetz
  {
    'morhetz/gruvbox',
    config = function()
      vim.o.background = 'dark' -- Set background to dark
      vim.cmd [[colorscheme gruvbox]] -- Apply Gruvbox color scheme
      ColorMyPencils(current_theme) -- Set highlight transparency
    end,
  },

  -- TokyoNight theme
  {
    'folke/tokyonight.nvim',
    config = function()
      setup_theme('tokyonight', { disable_background = true, style = 'night' })
      ColorMyPencils(current_theme) -- Use current_theme variable
    end,
  },

  -- Rose-Pine theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      setup_theme('rose-pine', { disable_background = true, style = 'main' })
      ColorMyPencils(current_theme) -- Use current_theme variable
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
