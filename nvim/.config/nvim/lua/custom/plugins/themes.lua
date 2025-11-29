return {
  {
    'gbprod/nord.nvim',
    name = 'nord',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('nord').setup {
        transparent = true,
      }

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
      vim.cmd.colorscheme 'nord'
    end,
  },
}
