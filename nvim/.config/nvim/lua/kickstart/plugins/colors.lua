function ColorMyPencils(color)
  vim.cmd.colorscheme(color)

  -- Set background to transparent for main editor sections
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

  -- Match Telescope and WhichKey background to Normal background
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'WhichKeyFloat', { link = 'Normal' })
end

return {

  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {},
    config = function()
      require('tokyonight').setup {
        style = 'night', -- Choose style: "storm", "moon", "night", "day"
        transparent = true, -- Disable setting the background color
        terminal_colors = true, -- Enable terminal colors in Neovim
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = 'dark',
          floats = 'dark',
        },
      }
      ColorMyPencils 'tokyonight' -- Set default tokyonight theme
    end,
  },
}
