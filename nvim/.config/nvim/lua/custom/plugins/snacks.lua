return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      sources = {
        files = {
          hidden = true,
        },
      },
      layout = {
        preset = 'ivy',
      },

      actions = {
        ---@param p snacks.Picker
        toggle_cwd = function(p)
          local cwd = vim.fs.normalize(vim.loop.cwd())
          local current = p:cwd()
          p:set_cwd(current == cwd and vim.fn.stdpath 'config' or cwd)
          p:find()
        end,
      },
    },
    notifier = {
      enabled = true,
    },
    -- terminal = {
    --   enabled = true,
    --   win = { position = 'right', width = 0.5 },
    -- },
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
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = 'Search Projects',
    },
    {
      '<leader>tt',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
  },
}
