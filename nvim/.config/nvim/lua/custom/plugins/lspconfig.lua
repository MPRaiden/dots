return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/snacks.nvim', opts = { picker = { enabled = true } } }, -- ensure snacks is loaded
    },

    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local buf = event.buf
          local pick = require('snacks').picker
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = buf, desc = 'LSP: ' .. desc })
          end

          map('gd', function()
            pick.lsp_definitions { auto_confirm = true }
          end, '[G]oto [D]efinition')

          map('gr', function()
            pick.lsp_references { auto_confirm = false }
          end, '[G]oto [R]eferences')

          map('<leader>D', function()
            pick.lsp_type_definitions { auto_confirm = false }
          end, 'Type [D]efinition')

          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {}

      require('mason').setup()
      require('mason-tool-installer').setup { ensure_installed = vim.tbl_keys(servers) }

      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_enable = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
