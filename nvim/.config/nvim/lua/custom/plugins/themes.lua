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
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        transparent = true,
        variant = "moon",
        styles = {
          italic = false,
          bold = true,
          transparency = true,
        },
      }
      FixColors()
      vim.cmd("colorscheme rose-pine-moon")
    end
  }, 
  {
    'gbprod/nord.nvim',
    name = 'nord',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('nord').setup {
        transparent = true,
      }
      FixColors()
      vim.cmd.colorscheme 'nord'
    end,
  },
}
