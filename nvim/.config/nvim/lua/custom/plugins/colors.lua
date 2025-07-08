return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    priority = 10000,
    lazy = false,
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        dark_variant = 'moon', -- required: expects a string
        dim_inactive_windows = false, -- required: boolean
        extend_background_behind_borders = false, -- required: boolean

        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },

        groups = {}, -- required
        highlight_groups = {}, -- required

        styles = {
          bold = true,
          italic = false,
        },

        before_highlight = function() -- required: at least a placeholder function
          -- no-op
        end,
      }
      vim.cmd.colorscheme 'rose-pine'

      if vim.g.neovide then
        vim.g.neovide_padding_top = 10
        vim.g.neovide_hide_mouse_when_typing = true
      end
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 10000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
      },
      sidebars = { 'qf', 'help' },
    },
    config = function()
      if vim.g.neovide then
        vim.g.neovide_padding_top = 10
      end

      vim.cmd.colorscheme 'tokyonight-night' -- night, storm, day, moon
    end,
  },
  {
    'savq/melange-nvim',
    enabled = true,
    lazy = false,
    priority = 10000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
      },
      sidebars = { 'qf', 'help' },
    },
    config = function()
      if vim.g.neovide then
        vim.g.neovide_padding_top = 10
      end

      vim.cmd.colorscheme 'melange'
    end,
  },
}
