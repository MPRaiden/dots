local set = vim.keymap.set
local opts = { noremap = true, silent = true }
local terminal_state = {
  buf = nil,
}

local function toggle_bottom_terminal()
  local existing_win = terminal_state.buf and vim.fn.bufwinid(terminal_state.buf) or -1
  if existing_win ~= -1 then
    vim.api.nvim_win_close(existing_win, true)
    return
  end

  local height = math.max(1, math.floor(vim.o.lines * 0.3))
  vim.cmd 'botright split'
  vim.cmd.wincmd 'J'

  if terminal_state.buf and vim.api.nvim_buf_is_valid(terminal_state.buf) then
    vim.api.nvim_win_set_buf(0, terminal_state.buf)
  else
    vim.cmd.terminal()
    terminal_state.buf = vim.api.nvim_get_current_buf()
  end

  vim.api.nvim_win_set_height(0, height)
  vim.wo.winfixheight = true
  vim.cmd.startinsert()
end

-- set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- copy current file
vim.keymap.set('n', '<C-c>', 'ggVG"+y', opts)

-- navigate splits
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('x', 'p', [["_dP]], { desc = 'Paste without overwriting register' })

vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

vim.keymap.set({ 'n', 't' }, '<C-.>', toggle_bottom_terminal, {
  desc = 'Toggle bottom terminal',
  silent = true,
})
