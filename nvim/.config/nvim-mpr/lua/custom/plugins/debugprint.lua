return {
  'andrewferrier/debugprint.nvim',
  opts = {
    keymaps = {
      normal = {
        variable_below = '<leader>db',
        -- You can define other mappings here as needed
      },
    },
  },
  dependencies = {
    'echasnovski/mini.nvim', -- Optional: Needed for line highlighting
    -- or
    -- 'echasnovski/mini.hipatterns', -- Optional: Needed for line highlighting
  },
  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = '*', -- Remove if you DON'T want to use the stable version
}
