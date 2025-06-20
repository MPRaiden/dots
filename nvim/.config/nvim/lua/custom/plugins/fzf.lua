return {
  'ibhagwan/fzf-lua',
  --dependencies = { 'nvim-tree/nvim-web-devicons' },
  dependencies = { 'echasnovski/mini.icons' },
  opts = {},
  keys = {
    {
      '<leader>sf',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Find Files in project directory',
    },
    {
      '<leader>sg',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = 'Find by grepping in project directory',
    },
    {
      '<leader>sn',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find in neovim configuration',
    },
    {
      '<leader>sh',
      function()
        require('fzf-lua').helptags()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>sw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = '[F]ind current [W]ord',
    },
    {
      '<leader>so',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[F]ind [O]ld Files',
    },
    {
      '<leader><leader>',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[,] Find existing buffers',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').lgrep_curbuf()
      end,
      desc = '[/] Live grep the current buffer',
    },
  },
}
