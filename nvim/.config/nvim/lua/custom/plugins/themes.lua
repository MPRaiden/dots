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
      transparent = true, -- disable background so the theme will set it
      terminal_colors = true, -- enable terminal (builtin) colors
      diff = { mode = 'bg' }, -- diff mode: background vs foreground
      borders = true, -- enable border between vertical splits
      errors = { mode = 'bg' }, -- how errors/diagnostics use backgrounds
      search = { theme = 'vim' }, -- search highlight theme: "vim" or "vscode"
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
      colorblind = {
        enable = false,
        preserve_background = false,
        severity = {
          protan = 0.0,
          deutan = 0.0,
          tritan = 0.0,
        },
      },
      on_colors = function(colors)
        -- override palette if desired
        -- colors.nord0_gui = "#1b2229"
      end,
      -- on_highlights = function(highlights, colors)
      --   -- custom highlight overrides
      --   highlights.CursorLineNr = { fg = colors.nord9_gui, bold = true }
      --   highlights.LineNrAbove = { fg = colors.nord6_gui }
      --   highlights.LineNrBelow = { fg = colors.nord6_gui }
      -- end,
    },
    config = function(_, opts)
      require('nord').setup(opts)
      vim.cmd.colorscheme 'nord'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'macchiato', -- options: "latte", "frappe", "macchiato", "mocha"
      -- background = {
      --   light = 'latte',
      --   dark = 'mocha',
      -- },
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
        conditionals = {},
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
      color_overrides = {
        -- you can override colors here per flavour or “all”
        all = {
          -- e.g. text = "#ffffff",
        },
        mocha = {
          -- override mocha-specific colors
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            -- e.g. CursorLine = { bg = colors.surface0 },
          }
        end,
        mocha = function(mocha)
          return {
            -- e.g. LineNr = { fg = mocha.overlay1 },
          }
        end,
      },
      integrations = {
        notify = true,
        flash = true,
        blink_cmp = {
          style = 'bordered',
        },
        snacks = {
          enabled = true,
          indent_scope_color = '', -- catppuccin color (eg. `lavender`) Default: text
        },
        lsp_trouble = true,
        -- many more per the docs :contentReference[oaicite:1]{index=1}
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
