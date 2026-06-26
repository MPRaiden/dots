vim.pack.add {
  'https://github.com/sphamba/smear-cursor.nvim',
}

require('smear_cursor').setup {
  opts = {
    stiffness = 0.5,
    trailing_stiffness = 0.5,
    matrix_pixel_threshold = 0.5,
  },
}
