return {
  "folke/trouble.nvim",
  event = "BufReadPost",
  opts = {},
  keys = {
     {
      "<leader>te",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
  cmd = "Trouble",
}
