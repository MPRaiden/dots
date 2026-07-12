vim.pack.add {
  'https://github.com/folke/snacks.nvim',
  'https://github.com/folke/noice.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

require('snacks').setup {
  input = { enabled = true },
  indent = { enabled = true },
}

require('noice').setup {
  cmdline = { enabled = true },
  views = {
    cmdline_popup = {
      border = {
        style = 'rounded',
      },
    },
  },
}
