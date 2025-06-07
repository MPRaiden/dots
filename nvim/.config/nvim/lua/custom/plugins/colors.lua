return {
  {
    'navarasu/onedark.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'deep',
        code_style = {
          comments = 'none',
        },
      }
      -- Enable theme
      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end
      require('onedark').load()
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = true,
    layy = false,
    config = function()
      require('rose-pine').setup {
        variant = 'auto',
        styles = {
          bold = false,
          italic = false,
        },
      }
      if vim.g.neovide then
        vim.g.neovide_padding_top = 20
        vim.g.neovide_hide_mouse_when_typing = true
      end
      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
