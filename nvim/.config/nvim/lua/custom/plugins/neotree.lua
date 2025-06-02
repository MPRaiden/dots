return {
  {
    'nvim-tree/nvim-tree.lua',
    enabled = true,
    lazy = false,
    priority = 900,
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('nvim-tree').setup {
        view = {
          width = 50,
          side = 'left',
          relativenumber = true,
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
        git = {
          enable = true,
        },
        filters = {
          dotfiles = false,
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
      }

      -- Set keymap to toggle nvim-tree with "-"
      vim.keymap.set('n', 'nt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },
}
