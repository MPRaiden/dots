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
    'AlexvZyl/nordic.nvim',
    name = 'nordic',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      transparent = {
        bg = true,
        float = false,
      },
      -- cursorline = {
      --   theme = 'dark', -- 'light' or 'dark' cursorline background
      -- },
      bold_keywords = false,
      italic_comments = true,
      bright_border = true,
      reduced_blue = true, -- Softer blue tones
      -- You can customize highlight groups here if desired
      -- on_highlights = function(hl, c)
      --   hl.CursorLineNr = { fg = c.orange.base, bold = true }
      --   hl.LineNrAbove = { fg = c.gray3 }
      --   hl.LineNrBelow = { fg = c.gray3 }
      -- end,
    },
    config = function(_, opts)
      require('nordic').setup(opts)
      vim.cmd.colorscheme 'nordic'
    end,
  },

  {
    'gbprod/nord.nvim',
    name = 'nord',
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- disable background so the theme will set it
      terminal_colors = true, -- enable terminal (builtin) colors
      -- diff = { mode = 'bg' }, -- diff mode: background vs foreground
      -- borders = true, -- enable border between vertical splits
      -- errors = { mode = 'bg' }, -- how errors/diagnostics use backgrounds
      -- search = { theme = 'vim' }, -- search highlight theme: "vim" or "vscode"
      styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
        bufferline = {
          current = {},
          modified = { italic = true },
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
}
