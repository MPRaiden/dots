function FixColors()
  vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            local groups = {
              "Normal", "NormalNC", "NormalFloat", "FloatBorder",
              "SignColumn", "MsgArea", "NvimTreeNormal", "NvimTreeNormalNC",
              "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal",
              "TelescopePromptBorder", "TelescopeResultsNormal", "TelescopeResultsBorder",
              "TelescopePreviewNormal", "TelescopePreviewBorder",
              "TroubleNormal", "TroubleNormalNC", "TroubleText", "TroubleCount",
              "CmpNormal", "CmpBorder", "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb",
              "SnacksNormal", "SnacksBorder", "NoicePopup", "NoicePopupmenu",
            }

            for _, group in ipairs(groups) do
              vim.cmd(string.format("hi %s guibg=NONE ctermbg=NONE", group))
            end
          end,
        })
  end


return {
  -- {
  --   'sainnhe/sonokai',
  --   name = 'sonokai',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.sonokai_enable_italic = false  -- or false
  --     vim.g.sonokai_style = 'andromeda' -- Styles: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
  --     vim.g.sonokai_better_performance = 0
  --     vim.g.sonokai_transparent_background = 1
  --     vim.cmd.colorscheme 'sonokai'
  --     FixColors()
  --   end,
  -- },
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require('ayu').setup {
        mirage = true,
        overrides = {},
        transparent = true,
      }
      FixColors()
      vim.cmd("colorscheme ayu-mirage")
    end
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('rose-pine').setup {
  --       transparent = true,
  --       variant = "moon",
  --       styles = {
  --         italic = false,
  --         bold = true,
  --         transparency = true,
  --       },
  --     }
  --     FixColors()
  --     vim.cmd("colorscheme rose-pine-moon")
  --   end
  -- }, 
  -- {
  --   'gbprod/nord.nvim',
  --   name = 'nord',
  --   enabled = false,
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('nord').setup {
  --       transparent = true,
  --     }
  --     FixColors()
  --     vim.cmd.colorscheme 'nord'
  --   end,
  -- },
}
