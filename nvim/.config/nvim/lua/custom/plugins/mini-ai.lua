return {
  'echasnovski/mini.ai',
  version = '*',
  event = 'VeryLazy', -- Optional: load lazily
  config = function()
    require('mini.ai').setup {}
  end,
}
