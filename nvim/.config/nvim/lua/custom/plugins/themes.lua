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
      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'macchiato',
      transparent_background = true,
      term_colors = true,
      -- dim_inactive = {
      --   enabled = true,
      --   shade = 'dark',
      --   percentage = 0.15,
      -- },
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
}
