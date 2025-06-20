return {
  {
    'stevearc/oil.nvim',
    -- no lazy-loading: always load
    lazy = false,
    opts = {
      default_file_explorer = true,
      float = {
        padding = 2,
        border = 'rounded',
        max_width = 0.5,
        max_height = 0.5,
        win_options = {
          winblend = 0,
        },
      },
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      {
        '<leader>-',
        function()
          require('oil').open_float(vim.fn.getcwd())
        end,
        desc = 'Open Oil at project root in float',
      },
      {
        '-',
        function()
          require('oil').open_float()
        end,
        desc = 'Open Oil at current buffer dir in float',
      },
    },
    -- automatically open float when launching nvim in a directory
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
