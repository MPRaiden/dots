vim.pack.add { 'https://github.com/indium114/smudge.nvim' }

require('smudge').setup {
  char = '░', -- smear character
  hl = 'SmudgeCursor',
  max_age = 80, -- ms before smear disappears
  length = 2, -- max trail length
}
