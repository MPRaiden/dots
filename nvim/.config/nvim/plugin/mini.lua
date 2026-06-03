vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

require('mini.statusline').setup {
  sections = { left = { 'mode' }, mid = { 'filename' }, right = { 'fileformat', 'filetype' } },
}

vim.defer_fn(function()
  require('mini.icons').setup()
end, 0)

vim.defer_fn(function()
  require('mini.pairs').setup()
end, 0)

vim.defer_fn(function()
  require('mini.ai').setup()
end, 0)

vim.defer_fn(function()
  require('mini.indentscope').setup()
end, 0)
