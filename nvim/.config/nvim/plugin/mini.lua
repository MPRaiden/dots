vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

require('mini.statusline').setup {
  sections = {
    left = { 'mode' },
    mid = { 'filename' },
    right = { 'fileformat', 'filetype' },
  },
}

require('mini.misc').setup()

require('mini.misc').setup_termbg_sync()

vim.defer_fn(function()
  require('mini.icons').setup()
end, 0)

vim.defer_fn(function()
  require('mini.indentscope').setup()
end, 0)
