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

vim.schedule(function()
  vim.pack.add { 'https://github.com/echasnovski/mini.ai' }
  require('mini.ai').setup {
    custom_textobjects = {
      f = require('mini.ai').gen_spec.treesitter {
        a = '@function.outer',
        i = '@function.inner',
      },
      c = require('mini.ai').gen_spec.treesitter {
        a = '@conditional.outer',
        i = '@conditional.inner',
      },
    },
  }
end)
