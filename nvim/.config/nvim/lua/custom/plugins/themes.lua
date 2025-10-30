return {
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      -- style = 'night', -- The theme comes in three styles, `storm`, `night`, and `day`
      transparent = true, -- Enable this to disable background color and use your terminal background
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = false },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = 'transparent', -- style for sidebars, such as NvimTree
        floats = 'transparent', -- style for floating windows
      },
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      -- Load the colorscheme here
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
