vim.o.winborder = 'rounded'

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.ruler = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 50

-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type! (try it, open cmdline, type %s/vim/nvim) -> this replaces all instances of "vim" string with "nvim" and you get to see the preview of it for the file
vim.opt.inccommand = 'split'

-- vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- cursor options (blinking effect)
vim.opt.guicursor = {
  'n-v-c:block',                                  -- Normal, visual, command-line: block cursor
  'i-ci-ve:ver25',                                -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  'r-cr:hor20',                                   -- Replace, command-line replace: horizontal bar cursor with 20% height
  'o:hor50',                                      -- Operator-pending: horizontal bar cursor with 50% height
  'a:blinkwait700-blinkoff400-blinkon250',        -- All modes: blinking settings
  'sm:block-blinkwait175-blinkoff150-blinkon175', -- Showmatch: block cursor with specific blinking settings
}

-- vim: ts=2 sts=2 sw=2 et
