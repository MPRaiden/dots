vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'
  end,
}
