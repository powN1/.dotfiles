return {
  "windwp/nvim-ts-autotag",
  lazy = true,
  event = { 'BufNewFile', 'BufReadPre' },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
