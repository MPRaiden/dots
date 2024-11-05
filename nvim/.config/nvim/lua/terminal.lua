-- Set local settings for terminal buffers
local set = vim.opt_local

-- Create an autocommand group for terminal settings
local term_group = vim.api.nvim_create_augroup('custom_term_open', { clear = true })

-- Set terminal buffer options when a terminal is opened
vim.api.nvim_create_autocmd('TermOpen', {
  group = term_group,
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0

    -- Set the buffer file type to terminal
    vim.bo.filetype = 'terminal'
  end,
})

-- Easily hit escape in terminal mode.
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { noremap = true, silent = true }) --NOTE: to future self, pressing "tt" creates an ordinary split based on config, only after pressin "a" do you enter into TERMINAL mode in that split, after you do your commands, to exit, press "Esc" twice, you will notice you're out of TERMINAL mode and in NORMAL mode again, now standard vim rules apply againt

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set('n', 'tt', function()
  print 'Terminal mapping triggered' -- Debug message

  vim.cmd 'new'
  vim.cmd 'wincmd J'
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd 'term'
end, { noremap = true, silent = true })
