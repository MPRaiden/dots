return {
  'rose-pine/neovim',
  name = 'rose-pine',
  enabled = true,
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

      -- palette = {
      --   moon = {
      --     base = '#000000',
      --   },
      -- }, -- required: at least an empty table
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
      vim.g.neovide_padding_top = 30
    end
  end,
}
