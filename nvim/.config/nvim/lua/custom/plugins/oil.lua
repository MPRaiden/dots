return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
    config = function(_, opts)
      require('oil').setup(opts)
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.expand '%') == 1 then
            require('oil').open_float(vim.fn.getcwd())
          end
        end,
      })
    end,
  },
}
