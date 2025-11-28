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
              { win = 'list', border = 'rounded' },
              { win = 'preview', title = '{preview}', width = 0.6, border = 'rounded' },
            },
            { win = 'input', height = 1, border = 'top' },
          },
        },
      },
      -- Rest of your configuration remains the same
      sources = {
        files = {
          hidden = true,
        },
      },
      actions = {
        ---@param p snacks.Picker
        toggle_cwd = function(p)
          -- Note: vim.loop is deprecated in nvim 0.10+, prefer vim.uv if available
          local loop = vim.uv or vim.loop
          local cwd = vim.fs.normalize(loop.cwd())
          local current = p:cwd()
          p:set_cwd(current == cwd and vim.fn.stdpath 'config' or cwd)
          p:find()
        end,
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
    'nvim-lua/plenary.nvim',
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },

  keys = {
    {
      '<leader>sf',
      function()
        require('snacks').picker.files()
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sg',
      function()
        require('snacks').picker.grep()
      end,
      desc = '[S]earch by [G]rep (live grep with previews)',
    },
    {
      '<leader>so',
      function()
        require('snacks').picker.recent()
      end,
      desc = '[S]earch Recent Files',
    },
    {
      '<leader>sn',
      function()
        require('snacks').picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch [N]eovim files',
    },
    {
      '<leader>sd',
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
      desc = 'Notification History',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
  },
}
