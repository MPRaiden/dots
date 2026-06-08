vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }

vim.defer_fn(function()
  vim.cmd.packadd 'nvim-treesitter'

  require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath 'data' .. '/site',
  }

  require('nvim-treesitter')
    .install({
      'bash',
      'javascript',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'terraform',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
    })
    :wait(300000)

  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      pcall(vim.treesitter.start, args.buf)
    end,
  })
end, 0)
