return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy', -- This ensures lazy loading based on the "VeryLazy" event
    opts = {
      lsp = {
        -- Override markdown rendering so that cmp and other plugins use Treesitter
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- Enable presets for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      views = { -- Add this section to configure the popup views
        cmdline_popup = {
          position = {
            row = '50%', -- Center vertically
            col = '50%', -- Center horizontally
          },
          size = {
            width = 60, -- Width of the popup
            height = 'auto', -- Height adjusts automatically
          },
        },
        popupmenu = {
          relative = 'editor', -- Position relative to the editor
          position = {
            row = '50%', -- Center vertically
            col = '50%', -- Center horizontally
          },
          size = {
            width = 60, -- Width of the popup menu
            height = 10, -- Fixed height for the popup menu
          },
          border = {
            style = 'rounded', -- Add a rounded border
            padding = { 0, 1 }, -- Padding: 0 for top/bottom, 1 for left/right
          },
          win_options = {
            winhighlight = { -- Customize highlight groups
              Normal = 'Normal',
              FloatBorder = 'DiagnosticInfo',
            },
          },
        },
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
}
