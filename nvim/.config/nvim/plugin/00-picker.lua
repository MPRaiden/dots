vim.pack.add {
  'https://github.com/ibhagwan/fzf-lua',
}

local fzf = require 'fzf-lua'

fzf.setup {
  -- { 'telescope' },
  fzf_colors = {
    true,
    ['bg+'] = '#2f3f5e',
    ['fg+'] = '#c8d3f5',
  },
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

vim.keymap.set('n', '<leader>f', function()
  fzf.files()
end, { desc = '[F]ind [F]iles' })

vim.keymap.set('n', '<leader>g', function()
  fzf.live_grep()
end, { desc = '[F]ind by [G]rep (live grep with previews)' })

vim.keymap.set('n', '<leader>o', function()
  fzf.oldfiles()
end, { desc = '[F]ind Recent Files' })

vim.keymap.set('n', '<leader>h', function()
  fzf.git_hunks()
end, { desc = 'Git diff (h)unks' })
