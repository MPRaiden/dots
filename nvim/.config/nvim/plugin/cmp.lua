vim.pack.add {
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '*' },
}

require('blink.cmp').setup {
  keymap = {
    preset = 'none', -- disable built-in presets
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-n>'] = { 'snippet_forward', 'select_next', 'fallback' },
    ['<C-p>'] = { 'snippet_backward', 'select_prev', 'fallback' },
  },
}
