vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  default_file_explorer = true,
  float = {
    max_width = 0.5,
    max_height = 0.5,
  },
  view_options = {
    show_hidden = true,
  },
}

local function open_oil_float(dir)
  require('oil').open_float(dir)
end

vim.keymap.set('n', '-', function()
  open_oil_float()
end, { desc = 'Open parent directory' })

vim.keymap.set('n', '<leader>-', function()
  open_oil_float(vim.fn.getcwd())
end, { desc = 'Open project root' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'oil',
  callback = function(event)
    vim.keymap.set('n', 'q', '<CMD>close<CR>', {
      buffer = event.buf,
      silent = true,
      desc = 'Close Oil',
    })
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Note: This ensures Oil opens in the CWD on startup if entering a dir
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.expand '%') == 1 then
      open_oil_float(vim.fn.getcwd())
    end
  end,
})
