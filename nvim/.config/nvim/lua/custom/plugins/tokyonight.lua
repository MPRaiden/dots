return {
  'folke/tokyonight.nvim',
  enabled = false,
  lazy = false,
  priority = 10000,
  opts = {
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = {},
      variables = {},
    },
    sidebars = { 'qf', 'help' },
  },
  config = function()
    if vim.g.neovide then
      vim.g.neovide_padding_top = 30
    end

    vim.cmd.colorscheme 'tokyonight' -- night, storm, day
  end,
}
