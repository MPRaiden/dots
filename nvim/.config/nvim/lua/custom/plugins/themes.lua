return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = false,
    enabled = true,
    config = function()
      require('onedark').setup {
        transparent = true,
        term_colors = true,
        cmp_itemkind_reverse = true,
        style = 'cool',
      }
      require('onedark').load()
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
      flavour = 'mocha',
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
      vim.cmd.colorscheme 'catppuccin-mocha'

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
