return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Ensures Gruvbox is loaded before other plugins
    opts = {
      terminal_colors = true, -- Use Gruvbox colors in the terminal
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- Invert for search, diffs, errors, etc.
      contrast = 'hard', -- You can also set "soft" or leave it empty
      palette_overrides = {}, -- Custom palette overrides
      dim_inactive = false,
      transparent_mode = false, -- Set true if you want a transparent background
      overrides = {
        SignColumn = { bg = '#1d2021' }, -- Match this to your 'Normal' background
      },
    },
    config = function(_, opts)
      require('gruvbox').setup(opts)
      vim.o.background = 'dark' -- Set Gruvbox to dark mode
      vim.cmd [[colorscheme gruvbox]] -- Apply the Gruvbox colorscheme
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
