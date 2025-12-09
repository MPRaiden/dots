return {
  'saghen/blink.cmp',
  version = '*',
  opts = {
    keymap = {
      preset = 'none', -- disable built-in presets
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-n>'] = { 'snippet_forward', 'select_next', 'fallback' },
      ['<C-p>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    },
  },
}
