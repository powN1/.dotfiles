return {
  "windwp/nvim-ts-autotag",
  -- dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
  -- The plugin won't work without even = "verylazy" for some reason
  event = "VeryLazy",
}
