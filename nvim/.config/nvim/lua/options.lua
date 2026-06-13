vim.o.winborder = 'rounded'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.o.smartindent = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 8
-- vim.opt.cursorline = true
vim.opt.guicursor = {
  'n-v-c:block', -- Normal, visual, command-line: block cursor
  'i-ci-ve:ver25', -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  'r-cr:hor20', -- Replace, command-line replace: horizontal bar cursor with 20% height
  'o:hor50', -- Operator-pending: horizontal bar cursor with 50% height
  'a:blinkwait700-blinkoff400-blinkon250', -- All modes: blinking settings
  'sm:block-blinkwait175-blinkoff150-blinkon175', -- Showmatch: block cursor with specific blinking settings
}
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autoread = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
