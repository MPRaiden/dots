return {
  {
    'tjdevries/colorbuddy.nvim',
    lazy = false,
    priority = 10000,
    config = function()
      require('custom.theme.mytheme').use()
    end,
  },
}
