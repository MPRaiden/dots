return {
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      -- example customization
      view = { side = 'left', width = 40 },
      update_focused_file = { enable = true, update_root = true },
      -- ...other nvim-tree options

      -- In normal mode, toggle nvim-tree with Ctrl+n
      vim.keymap.set('n', '<C-n>', '<cmd>:NvimTreeToggle<CR>', { desc = 'Toggle File Explorer' }),
    },
  },
  -- other plugin overrides...
}
