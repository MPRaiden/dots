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
  }

  -- Apply transparency to all groups
  for _, group in ipairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'none' })
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

-- Color schemes
return {
  -- Gruvbox theme
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Ensures Gruvbox is loaded first
    opts = {
      terminal_colors = true,
      contrast = 'hard',
      palette_overrides = {},
      dim_inactive = false,
      transparent_mode = true, -- Enable transparency
      background_colour = '#000000', -- Fix NotifyBackground warning
      overrides = {
        SignColumn = { bg = 'none' }, -- Match SignColumn to background
      },
    },
    config = function(_, opts)
      -- Setup Gruvbox and apply transparency
      require('gruvbox').setup(opts)
      vim.o.background = 'dark'
      vim.cmd [[colorscheme gruvbox]]
      ColorMyPencils 'gruvbox'
    end,
  },

  -- TokyoNight theme
  -- {
  --   'folke/tokyonight.nvim',
  --   config = function()
  --     setup_theme('tokyonight', { disable_background = true, style = 'moon', styles = { italic = false } })
  --     ColorMyPencils 'tokyonight' -- Switch to TokyoNight
  --   end,
  -- },

  -- Rose-Pine theme
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   config = function()
  --     setup_theme('rose-pine', { disable_background = true, style = 'moon', styles = { italic = false } })
  --     ColorMyPencils 'rose-pine' -- Switch to Rose-Pine
  --   end,
  -- },
}

-- vim: ts=2 sts=2 sw=2 et
