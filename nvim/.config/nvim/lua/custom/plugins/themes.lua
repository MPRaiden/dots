return {
  -- catppuccin
  {
    'catppuccin/nvim',
    enabled = true,
    name = 'catppuccin',
    lazy = false, -- load right away (so your theme applies immediately)
    priority = 1000, -- high priority ensures it loads before other plugins
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato', -- one of: "latte", "frappe", "macchiato", "mocha"
        background = { -- :h catppuccin-background
          light = 'latte',
          dark = 'macchiato',
        },
        auto_integrations = true,
        transparent_background = true, -- disables background color
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = true, -- set terminal ANSI colors to theme palette
        dim_inactive = {
          enabled = false, -- dims inactive windows
          shade = 'dark',
          percentage = 0.15,
        },
        no_italic = true, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h catppuccin.highlights`)
          comments = { 'italic' },
          -- conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        -- custom_highlights = function(colors)
        --   return {
        --     -- override highlight groups after colors are computed
        --     -- e.g.
        --     -- TelescopeBorder = { bg = colors.surface0, fg = colors.surface0 },
        --     -- TelescopePromptNormal = { bg = colors.crust },
        --   }
        -- end,
        integrations = {
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              warnings = { 'undercurl' },
            },
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      }

      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },

  -- rose pine
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   enabled = true,
  --   lazy = false, -- load right away (so your theme applies immediately)
  --   priority = 1000, -- high priority ensures it loads before other plugins
  --   config = function()
  --     require('rose-pine').setup {
  --       -- @usage 'main' | 'moon' | 'dawn'
  --       variant = 'main',
  --       -- @usage 'auto' | 'neovim' | 'kitty' | 'wezterm' | 'iterm' | 'ghostty'
  --       dark_variant = 'main',
  --       bold_vert_split = false,
  --       dim_inactive_windows = false,
  --       extend_background_behind_borders = true,

  --       -- disable_background = false, -- Disables setting the background color.
  --       disable_background = true, -- For a transparent background
  --       disable_float_background = true, -- Disables setting the background color for floating windows.
  --       disable_terminal_colors = false, -- Disables setting terminal colors.

  --       -- Change specific vim highlight groups.
  --       -- For a list of available colors, see `:h rose-pine-colors`
  --       highlight_groups = {
  --         -- Comment = { fg = 'foam' },
  --         -- VertSplit = { fg = 'muted', bg = 'muted' },
  --       },

  --       -- Set highlight groups for specific filetypes.
  --       -- filetype_highlights = {},

  --       -- The styles of variants can be overwritten.
  --       styles = {
  --         bold = true,
  --         italic = false,
  --         transparency = false,
  --       },
  --     }

  --     vim.cmd.colorscheme 'rose-pine'
  --   end,
  -- },

  -- tokyonight
  -- {
  --   'folke/tokyonight.nvim',
  --   name = 'tokyonight',
  --   enabled = true, -- Set to true to use this theme
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = 'night', -- The theme comes in three styles, `storm`, `night`, and `day`
  --     transparent = true, -- Enable this to disable background color and use your terminal background
  --     styles = {
  --       -- Style to be applied to different syntax groups
  --       -- Value is any valid attr-list value for `:help nvim_set_hl`
  --       comments = { italic = true },
  --       keywords = { italic = false },
  --       -- Background styles. Can be "dark", "transparent" or "normal"
  --       sidebars = 'transparent', -- style for sidebars, such as NvimTree
  --       floats = 'transparent', -- style for floating windows
  --     },
  --   },
  --   config = function(_, opts)
  --     require('tokyonight').setup(opts)
  --     -- Load the colorscheme here
  --     vim.cmd.colorscheme 'tokyonight'
  --   end,
  -- },

  -- onedark
  -- {
  --   'navarasu/onedark.nvim',
  --   name = 'onedark',
  --   enabled = true,
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('onedark').setup {
  --       style = 'deep', -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
  --       transparent = true, -- Show/hide background
  --       term_colors = true, -- Change terminal color scheme
  --       ending_tildes = false, -- Show the end-of-buffer tildes
  --       code_style = {
  --         comments = 'italic',
  --         keywords = 'none',
  --         functions = 'none',
  --         strings = 'none',
  --         variables = 'none',
  --       },
  --     }
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },
}
