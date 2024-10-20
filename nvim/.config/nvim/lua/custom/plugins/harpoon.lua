return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- Add to harpoon menu
    vim.keymap.set('n', '<c-n>', function()
      harpoon:list():add()
    end)
    -- See harpoon menu
    vim.keymap.set('n', '<c-m>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- Toogle between different saved files
    for _, idx in ipairs { 1, 2, 3, 4, 5 } do
      vim.keymap.set('n', string.format('<space>%d', idx), function()
        harpoon:list():select(idx)
      end)
    end
    -- Set the Harpoon menu background and foreground colors
    vim.api.nvim_set_hl(0, 'HarpoonWindow', { fg = '#ebdbb2', bg = '#282828' }) -- Window appearance
    vim.api.nvim_set_hl(0, 'HarpoonBorder', { fg = '#928374', bg = '#282828' }) -- Border around menu
  end,
}
