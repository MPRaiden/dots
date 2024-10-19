-- Centralized function to set highlights and colors
local function ColorMyPencils(color)
  color = color or 'rose-pine-moon' -- Use rose-pine-moon explicitly
  vim.cmd.colorscheme(color)
  local highlight_groups = {
    'Normal',
    'NormalFloat',
    'TelescopeNormal',
    'TelescopeBorder',
    'TelescopePromptNormal',
    'TelescopePromptBorder',
    'TelescopeResultsNormal',
    'TelescopeResultsBorder',
    'TelescopePreviewNormal',
    'TelescopePreviewBorder',
  }
  for _, group in ipairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'none' })
  end
end

-- Shared config function for common theme options
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

-- Plugin setup
return {
  -- TokyoNight theme
  {
    'folke/tokyonight.nvim',
    config = function()
      setup_theme('tokyonight', { disable_background = true, style = 'moon', styles = { italic = false } }) -- style options are moon, storm and night
    end,
  },

  -- Rose-pine theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      setup_theme('rose-pine', { disable_background = true, style = 'moon', styles = { italic = false } }) -- style options are main, moon, and dawn
      -- Apply custom color scheme with moon variant
      ColorMyPencils 'rose-pine'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
