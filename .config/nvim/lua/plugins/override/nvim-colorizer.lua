return {
  "NvChad/nvim-colorizer.lua",
  -- enabled = false,
  config = function()
    require("colorizer").setup {
      user_default_options = {
        tailwind = true,
      },
    }
  end,
  lazy = false,
}
