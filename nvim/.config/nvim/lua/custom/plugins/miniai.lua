return {
  'echasnovski/mini.ai',
  enabled = true,
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('mini.ai').setup {}
  end,
}
