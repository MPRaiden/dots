local set = vim.keymap.set

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>o', '<Cmd>source %<CR>', { desc = 'Source ' .. vim.fn.expand '$MYVIMRC' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- copy current file
vim.keymap.set('n', '<C-c>', 'ggVG"+y', { noremap = true, silent = true })

-- exit insert mode
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
