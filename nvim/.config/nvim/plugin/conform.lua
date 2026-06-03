vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    golang = { 'gofumpt' },
    sql = { 'sqlfmt' },
    json = { 'prettierd' },
    jsonl = { 'jq' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}

-- Format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})
