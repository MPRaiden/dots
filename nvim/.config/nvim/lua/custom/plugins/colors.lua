return {
  {
    'navarasu/onedark.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        --style = 'dark',
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
}
