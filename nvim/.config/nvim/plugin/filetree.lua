vim.pack.add {
  'https://github.com/nvim-tree/nvim-tree.lua',
}

require('nvim-tree').setup {
  view = {
    side = 'right',
    width = 50,
  },
  update_focused_file = {
    enable = true,
  },
  filters = {
    dotfiles = false,
  },
}

local normal = vim.api.nvim_get_hl(0, { name = 'Normal', link = false })
if normal.bg then
  for _, group in ipairs {
    'NvimTreeEndOfBuffer',
    'NvimTreeWinSeparator',
    'NvimTreeWinSeparatorNC',
    'NvimTreeVertSplit',
  } do
    vim.api.nvim_set_hl(0, group, { fg = normal.bg, bg = normal.bg })
  end
end

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
