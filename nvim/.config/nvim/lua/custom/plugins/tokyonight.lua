return {
  'folke/tokyonight.nvim',
  enabled = false,
  lazy = false, -- load right away (so your theme applies immediately)
  priority = 1000, -- high priority ensures it loads before other plugins
  config = function()
    require('tokyonight').setup {
      style = 'night', -- one of: "storm", "moon", "night", or "day"
      light_style = 'moon', -- used when background is set to light
      transparent = true, -- disables background color
      terminal_colors = true, -- set terminal ANSI colors to theme palette
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = 'dark', -- background style for sidebar windows
        floats = 'dark', -- same for floating windows
      },
      day_brightness = 0.3, -- light theme brightness between 0‑1
      dim_inactive = false, -- dim inactive windows
      lualine_bold = false, -- make section headers bold in lualine
      cache = true, -- cache theme for performance
      on_colors = function(colors)
        -- override any palette colors
        colors.error = '#ff5555'
        colors.hint = colors.orange
      end,
      on_highlights = function(hl, c)
        -- override highlight groups after colors are computed
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = '#2d3149' }
      end,
      plugins = {
        all = package.loaded.lazy == nil, -- auto-enable plugin support if not lazy-loading
        -- plugin-specific toggles can be set here, e.g.:
        -- telescope = true,
      },
    }
    -- apply the colorscheme after setup
    vim.cmd [[colorscheme tokyonight]]
  end,
}
