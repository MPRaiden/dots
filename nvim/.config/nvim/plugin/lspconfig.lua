vim.pack.add {
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/neovim/nvim-lspconfig',
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf
    local pick = require 'fzf-lua'
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = buf, desc = 'LSP: ' .. desc })
    end

    map('gd', function()
      pick.lsp_definitions()
    end, '[G]oto [D]efinition')

    map('gr', function()
      pick.lsp_references { jump1 = false }
    end, '[G]oto [R]eferences')

    map('<leader>D', function()
      pick.lsp_typedefs { jump1 = false }
    end, 'Type [D]efinition')

    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  end,
})

local capabilities = require('blink.cmp').get_lsp_capabilities()
local servers = {
  ts_ls = {},
  pyright = {},
  gopls = {},
  terraformls = {},
}

vim.defer_fn(function()
  require('fidget').setup {}
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
end, 0)
