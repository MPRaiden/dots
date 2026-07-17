vim.pack.add { 'https://github.com/rebelot/kanagawa.nvim' }

-- Default options:
require('kanagawa').setup {
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = false },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = true, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = { -- add/modify theme and palette colors
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  overrides = function(_)
    local transparent = { bg = 'none' }

    return {
      -- Generic floating windows and completion menus
      NormalFloat = transparent,
      FloatBorder = transparent,
      Pmenu = transparent,
      PmenuExtra = transparent,
      PmenuKind = transparent,

      -- snacks.nvim picker
      SnacksPickerNormal = transparent,
      SnacksPickerBorder = transparent,
      SnacksPickerInput = transparent,
      SnacksPickerInputBorder = transparent,
      SnacksPickerList = transparent,
      SnacksPickerListBorder = transparent,
      SnacksPickerPreview = transparent,
      SnacksPickerPreviewBorder = transparent,

      -- blink.cmp
      BlinkCmpMenu = transparent,
      BlinkCmpMenuBorder = transparent,
      BlinkCmpDoc = transparent,
      BlinkCmpDocBorder = transparent,
      BlinkCmpSignatureHelp = transparent,
      BlinkCmpSignatureHelpBorder = transparent,
    }
  end,
  theme = 'auto', -- Load "wave" theme
  background = { -- map the value of 'background' option to a theme
    dark = 'wave', -- try "dragon" !
    light = 'lotus',
  },
}

-- setup must be called before loading
vim.cmd 'colorscheme kanagawa'
