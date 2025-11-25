return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    enabled = true,
    config = function()
      require('onedark').setup {
        style = 'deep',
        term_colors = true,
        transparent = true,
        highlights = {
          -- Function keyword (e.g. `fn`, `function`)
          ['@keyword.function'] = { fg = '#e5c07b' }, -- yellowish/orange
          -- Function name (identifiers)
          ['@function'] = { fg = '#61afef' }, -- light blue
          ['@function.call'] = { fg = '#61afef' },
          -- Brackets / punctuation
          ['@punctuation.bracket'] = { fg = '#e06c75' }, -- light red/pink tone
          ['@punctuation.delimiter'] = { fg = '#e06c75' }, -- commas, semicolons, etc.
        },
      }
      require('onedark').load()
    end,
  },
}
