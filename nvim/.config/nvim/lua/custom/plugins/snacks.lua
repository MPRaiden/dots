return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      layout = {
        preset = 'ivy',
        -- layout = {
        --   box = 'horizontal',
        --   backdrop = false,
        --   width = 0.9,
        --   height = 0.8,
        --   border = 'none',
        --   {
        --     box = 'vertical',
        --     { win = 'list', title = ' Results ', title_pos = 'center', border = 'rounded' },
        --     { win = 'input', height = 1, border = 'rounded', title = '{title} {live} {flags}', title_pos = 'center' },
        --   },
        --   {
        --     win = 'preview',
        --     title = '{preview:Preview}',
        --     width = 0.7,
        --     border = 'rounded',
        --     title_pos = 'center',
        --   },
        -- },
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
    terminal = {
      enabled = true,
      -- win = {
      --   style = 'float',
      --   width = math.floor(vim.o.columns * 0.75),
      --   height = math.floor(vim.o.lines * 0.5),
      --   border = 'rounded',
      -- },
    },
    notifier = {
      enabled = true,
    },
    animate = {
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
    -- {
    --   '<leader>sl',
    --   function()
    --     require('snacks').picker.notifications()
    --   end,
    --   desc = '[S]earch Notifications',
    -- },
    {
      '<leader>tt',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = 'Projects',
    },
  },
}
