return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      local Terminal = require('toggleterm.terminal').Terminal

      -- Create a dedicated horizontal terminal
      local horiz_term = Terminal:new {
        direction = 'horizontal',
        size = function()
          return math.floor(vim.o.lines * 0.33)
        end,
        start_in_insert = true,
        close_on_exit = false,
        persist_mode = false, -- disable to force insert mode each toggle
      }

      require('toggleterm').setup {
        direction = 'horizontal',
        size = function(_)
          return math.floor(vim.o.lines * 0.33)
        end,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_mode = false,
        close_on_exit = false,
      }

      -- Toggle terminal with leader+t
      vim.keymap.set('n', '<leader>t', function()
        horiz_term:toggle()
      end, { desc = 'Toggle horizontal terminal' })
      vim.keymap.set('i', '<leader>t', '<Esc><Cmd>lua horiz_term:toggle()<CR>', { desc = 'Toggle horizontal terminal', silent = true })

      -- Always enter insert mode on open
      vim.api.nvim_create_autocmd({ 'TermOpen', 'BufEnter', 'TermEnter' }, {
        pattern = 'term://*toggleterm#*',
        callback = function()
          vim.cmd.startinsert()
        end,
      })

      -- Double-Esc to normal mode in terminal
      vim.api.nvim_create_autocmd('TermOpen', {
        pattern = 'term://*toggleterm#*',
        callback = function()
          local opts = { buffer = 0, noremap = true, silent = true }
          vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', opts)
        end,
      })
    end,
  },
}
