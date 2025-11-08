return {
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
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
  {
    'gbprod/nord.nvim',
    name = 'nord',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      terminal_colors = true,
      diff = { mode = 'bg' },
      borders = true,
      errors = { mode = 'bg' },
      search = { theme = 'vim' },
      styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
        bufferline = {
          current = {},
          modified = { italic = false },
        },
        lualine_bold = false,
      },
    },
    config = function(_, opts)
      require('nord').setup(opts)
      vim.cmd.colorscheme 'nord'
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'macchiato',
      transparent_background = true,
      term_colors = true,
      dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = true,
      styles = {
        comments = { 'italic' },
      },
      integrations = {
        notify = true,
        flash = true,
        blink_cmp = { style = 'bordered' },
        snacks = { enabled = true, indent_scope_color = '' },
        lsp_trouble = true,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    'navarasu/onedark.nvim',
    name = 'onedark',
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      style = 'dark', -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
      transparent = false,
      term_colors = true,
      code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none',
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      require('onedark').load()
    end,
  },
}
