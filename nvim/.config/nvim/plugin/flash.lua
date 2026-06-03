vim.schedule(function()
  vim.pack.add { 'https://github.com/folke/flash.nvim' }
  require('flash').setup {
    modes = {
      char = { enabled = false },
    },
  }
end)

vim.keymap.set('n', 's', function()
  require('flash').jump()
end, { desc = 'Flash' })
