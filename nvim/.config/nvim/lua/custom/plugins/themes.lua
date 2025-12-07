return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
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
      vim.cmd("colorscheme rose-pine-moon")
    end
  }, 
}
