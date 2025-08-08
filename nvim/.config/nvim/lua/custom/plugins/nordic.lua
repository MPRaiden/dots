return {
  'AlexvZyl/nordic.nvim',
  enabled = true,
  lazy = false, -- load immediately so theme is applied
  priority = 1000, -- high priority to override other plugins
  config = function()
    require('nordic').setup {
      bold_keywords = true,
      italic_comments = true,
      transparent = { bg = true, float = true },
      bright_border = true,
      reduced_blue = false,
      swap_backgrounds = false,
      cursorline = {
        bold = true,
        bold_number = false,
        theme = 'dark', -- options: "light" or "dark"
        blend = 0.85,
      },
      noice = { style = 'flat' }, -- or "classic"
      on_highlight = function(highlights, _palette)
        for _, highlight in pairs(highlights) do
          highlight.italic = false
        end
      end,
    }

    -- Finally, apply the colorscheme
    vim.cmd.colorscheme 'nordic'
  end,
}
