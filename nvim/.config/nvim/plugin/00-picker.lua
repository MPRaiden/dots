vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons',
}

vim.pack.add {
  'https://github.com/folke/snacks.nvim',
}

local snacks = require 'snacks'

snacks.setup {
  terminal = {},
  picker = {
    layout = {
      hidden = { 'preview' },
      layout = {
        backdrop = false,
        row = 1,
        width = 0.3,
        min_width = 70,
        height = 0.4,
        border = 'none',
        box = 'vertical',
        { win = 'input', height = 1, border = true, title = '{title} {live} {flags}', title_pos = 'center' },
        { win = 'list', border = 'hpad' },
        { win = 'preview', title = '{preview}', border = true },
      },
    },
    sources = {
      files = {
        hidden = true,
        ignored = false,
        follow = true,
        exclude = { '.git', 'node_modules' },
      },
      grep = {
        hidden = true,
        ignored = true,
        follow = true,
        exclude = { '.git', 'node_modules' },
        layout = { hidden = {} },
      },
      recent = {
        filter = { cwd = true },
      },
      git_diff = {
        group = false,
      },
    },
  },
}

vim.keymap.set('n', 'ff', function()
  snacks.picker.files()
end, { desc = '[F]ind [F]iles' })

vim.keymap.set('n', 'fg', function()
  snacks.picker.grep()
end, { desc = '[F]ind by [G]rep (live grep with previews)' })

vim.keymap.set('n', 'fo', function()
  snacks.picker.recent()
end, { desc = '[F]ind Recent Files' })

vim.keymap.set('n', 'fh', function()
  snacks.picker.git_diff()
end, { desc = 'Git diff (h)unks' })

vim.keymap.set({ 'n', 't' }, '<C-`>', function()
  snacks.terminal.toggle()
end, { desc = 'Toggle terminal' })
