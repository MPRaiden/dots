-- vim.schedule(function()
--   vim.pack.add { 'https://github.com/echasnovski/mini.misc' }
--   require('mini.misc').setup()
--   MiniMisc.setup_termbg_sync()
-- end)

vim.schedule(function()
  vim.pack.add { 'https://github.com/echasnovski/mini.indentscope' }
  require('mini.indentscope').setup {
    draw = {
      delay = 100,
    },
    symbol = '┊',
  }
end)
