vim.pack.add {
  'https://github.com/ibhagwan/fzf-lua',
}

local fzf = require 'fzf-lua'

fzf.setup {
  -- 100 is full transparent
  winopts = {
    backdrop = 100,
  },
  fzf_colors = {
    ['fg'] = { 'fg', 'Normal' },
    ['bg'] = { 'bg', 'Normal' },
    ['hl'] = { 'fg', '#42c6ff' },
    ['fg+'] = { 'fg', 'CursorLine' },
    ['bg+'] = { 'bg', 'CursorLine' },
    ['hl+'] = { 'fg', '#42c6ff' },
    ['info'] = { 'fg', '#3ad900' },
    ['prompt'] = { 'fg', '#f7c95c' },
    ['pointer'] = { 'fg', '#ff3158' },
    ['marker'] = { 'fg', '#ff3158' },
    ['spinner'] = { 'fg', '#f7c95c' },
    ['header'] = { 'fg', '#c8a2ff' },
    ['border'] = { 'fg', '#2b3448' },
  },
  { 'telescope' },
  files = {
    hidden = true,
    no_ignore = false,
    fd_opts = [[--color=never --type f --type l --hidden --follow --exclude .git --exclude node_modules]],
    rg_opts = [[--color=never --files --hidden --follow --no-ignore -g "!.git" -g "!node_modules"]],
  },
  grep = {
    hidden = true,
    no_ignore = true,
    rg_opts = [[--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden --follow --no-ignore -g "!.git" -g "!node_modules" -e]],
  },
  oldfiles = {
    cwd_only = false,
    stat_file = true,
  },
  lsp = {
    jump1 = true,
  },
}

vim.keymap.set('n', '<leader>ff', function()
  fzf.files()
end, { desc = '[F]ind [F]iles' })

vim.keymap.set('n', '<leader>fg', function()
  fzf.live_grep()
end, { desc = '[F]ind by [G]rep (live grep with previews)' })

vim.keymap.set('n', '<leader>fo', function()
  fzf.oldfiles()
end, { desc = '[F]ind Recent Files' })

vim.keymap.set('n', '<leader>fh', function()
  fzf.git_hunks()
end, { desc = 'Git diff (h)unks' })
