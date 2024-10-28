return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        sql = { 'sqlfmt' },
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

    -- Bind <leader>f to format
    vim.api.nvim_set_keymap('n', '<leader>f', ':lua require("conform").format()<CR>', { noremap = true, silent = true })
  end,
}
