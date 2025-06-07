return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        rust = { 'rustfmt' },
        javascript = { 'prettierd' },
        golang = { 'gofumpt' },
        sql = { 'sqlfmt' },
        yaml = { 'yamlfmt' }, -- TODO: Investigate how to customize this (current formatting doesn't leave spaces between stages)
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
