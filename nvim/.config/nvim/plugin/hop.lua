vim.pack.add { 'https://github.com/smoka7/hop.nvim' }

require('hop').setup()

vim.keymap.set('n', 's', function()
  require('hop').hint_words()
end, { desc = 'Hop to word' })
