-- Rose Pine
-- return {
--   {
--     'rose-pine/neovim',
--     name = 'rose-pine',
--     lazy = false, -- Enable lazy loading
--     config = function()
--       -- Set up the colorscheme
--       require('rose-pine').setup {
--         variant = 'main', -- Options 'main', 'moon', or 'dawn'
--         dark_variant = 'main',
--         disable_background = true,
--         disable_italics = true,
--       }
--       -- Apply the colorscheme
--       vim.cmd 'colorscheme rose-pine'
--     end,
--   },
-- }

--  Tokyo Night
return {
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false, -- Disable lazy loading for immediate use
    config = function()
      -- Tokyo Night setup
      require('tokyonight').setup {
        -- style = 'night', -- Options 'storm', 'night', 'day', 'moon'
        transparent = true, -- Match with disable_background from rose-pine
        terminal_colors = true,
      }
      -- Apply the colorscheme
      vim.cmd 'colorscheme tokyonight'
    end,
  },
}
