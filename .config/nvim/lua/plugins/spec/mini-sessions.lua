return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.sessions").setup()
    -- require("mini.starter").setup()
  end,
}
