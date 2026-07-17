vim.pack.add {
  'https://github.com/stevearc/oil.nvim',
}

local oil = require 'oil'

oil.setup {
  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>-', function()
  oil.open(vim.fn.getcwd())
end, { desc = 'Open working directory' })
