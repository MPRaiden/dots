return {
  'rose-pine/neovim',
  enabled = false,
  name = 'rose-pine',
  lazy = false, -- load right away (so your theme applies immediately)
  priority = 1000, -- high priority ensures it loads before other plugins
  config = function()
    require('rose-pine').setup {
      variant = 'main', -- options: 'main', 'moon', 'dawn'
      dark_variant = 'main', -- which variant to use when background=dark
      bold_vert_split = false,
      dim_nc_background = false, -- dim inactive windows
      disable_background = true, -- transparent background
      disable_float_background = false, -- transparent floating windows
      disable_italics = true,

      groups = {
        background = 'none',
        panel = 'none',
        border = 'muted',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
      },

      -- highlight_groups = {
      --   TelescopeBorder = { fg = 'overlay', bg = 'overlay' },
      --   TelescopePromptNormal = { bg = '#2d3149' },
      -- },
    }

    -- apply the colorscheme after setup
    vim.cmd [[colorscheme rose-pine]]
  end,
}
