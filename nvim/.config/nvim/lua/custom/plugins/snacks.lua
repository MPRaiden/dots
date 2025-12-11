return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      layout = 'custom',
      layouts = {
        custom = {
          layout = {
            box = 'vertical',
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.4,
            border = 'none',
            title = ' {title} {live} {flags}',
            title_pos = 'left',
            {
              box = 'horizontal',
              { win = 'list',    border = 'rounded' },
              { win = 'preview', title = '{preview}', width = 0.6, border = 'rounded' },
            },
            { win = 'input', height = 1, border = 'top' },
          },
        },
      },
      sources = {
        files = {
          hidden = true,
        },
      },
    },
    input = {
      enabled = true,
      icon = ' ',
      win = { style = 'input' },
      expand = true,
    },
    notifier = {
      enabled = true,
      style = 'compact',
    },
    scroll = {
      enabled = true,
    },
  },

  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },

  keys = {
    {
      '<leader>ff',
      function()
        require('snacks').picker.files()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fg',
      function()
        require('snacks').picker.grep()
      end,
      desc = '[F]ind by [G]rep (live grep with previews)',
    },
    {
      '<leader>fo',
      function()
        require('snacks').picker.recent()
      end,
      desc = '[F]ind Recent Files',
    },
    {
      '<leader>fn',
      function()
        require('snacks').picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind [N]eovim files',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader><space>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>n',
      function()
        Snacks.notifier.show_history()
      end,
      desc = '[N]otification History',
    },
    {
      '<leader>fh',
      function()
        Snacks.picker.help()
      end,
      desc = '[F]ind [H]elp Pages',
    },
  },
}
