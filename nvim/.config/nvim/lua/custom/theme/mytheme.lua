local M = {}

function M.use()
  local cb = require 'colorbuddy'
  if vim.g.neovide then
    vim.g.neovide_padding_top = 30
  end
  cb.colorscheme 'colorbuddy'
  require('custom.theme.colors').apply()
end

return M
