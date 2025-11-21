return {
  {
    'sainnhe/sonokai',
    name = 'sonokai',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      -- Styles: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
      vim.g.sonokai_style = 'andromeda'
      vim.g.sonokai_better_performance = 0
      -- Transparency: 0 = none, 1 = normal, 2 = all (includes status line)
      vim.g.sonokai_transparent_background = 1
      vim.cmd.colorscheme 'sonokai'
    end,
  },

  {
    'gbprod/nord.nvim',
    name = 'nord',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('nord').setup {
        transparent = true,
      }
      vim.cmd.colorscheme 'nord'
    end,
  },

  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'frappe',
      transparent_background = true,
      term_colors = true,
      no_italic = false,
      no_bold = true,
      styles = {
        comments = { 'italic' },
      },
      integrations = {
        notify = true,
        flash = true,
        blink_cmp = { style = 'bordered' },
        snacks = { enabled = true, indent_scope_color = 'mauve' },
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        lsp_trouble = true,
        gitsigns = true,
        mason = true,
      },
    },
    config = function(_, opts)
      local catppuccin = require 'catppuccin'
      catppuccin.setup(opts)
      vim.cmd.colorscheme 'catppuccin-frappe'

      -- fully transparent backgrounds to match Ghostty terminal
      local transparent_groups = {
        'Normal',
        'NormalNC',
        'NormalFloat',
        'FloatBorder',
        'Pmenu',
        'PmenuSel',
        'PmenuSbar',
        'PmenuThumb',
        'StatusLine',
        'StatusLineNC',
        'SnacksNormal',
        'SnacksBorder',
        'TelescopeNormal',
        'TelescopeBorder',
        'WhichKeyFloat',
        'CmpPmenu',
      }

      for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = 'none' })
      end
    end,
  },
}
