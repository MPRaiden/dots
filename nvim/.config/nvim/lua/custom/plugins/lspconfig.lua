return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
      local on_attach = function(event)
        local group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true })
        vim.api.nvim_create_autocmd('LspAttach', {
          group = group,
          callback = function(ev)
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
            end

            local fzf = require 'fzf-lua'
            map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
            map('gr', fzf.lsp_references, '[G]oto [R]eferences')
            map('<leader>D', fzf.lsp_type_definitions, 'Type [D]efinition')
            map('<leader>ds', fzf.lsp_document_symbols, '[D]ocument [S]ymbols')
            map('<leader>ws', fzf.lsp_workspace_symbols, '[W]orkspace [S]ymbols')
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            map('K', vim.lsp.buf.hover, 'Hover Documentation')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          end,
        })
      end

      -- Use blink.cmp’s built‑in LSP capabilities instead of cmp_nvim_lsp
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
      }

      require('mason').setup()
      require('mason-tool-installer').setup { ensure_installed = vim.tbl_keys(servers) }

      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_enable = true,
        handlers = {
          function(server_name)
            local server_opts = servers[server_name] or {}
            server_opts.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_opts.capabilities or {})
            server_opts.on_attach = on_attach
            require('lspconfig')[server_name].setup(server_opts)
          end,
        },
      }
    end,
  },
}
