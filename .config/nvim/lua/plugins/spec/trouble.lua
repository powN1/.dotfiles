return {
  "folke/trouble.nvim",
  -- event = "BufReadPost",
  opts = {},
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>te", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle trouble" })
  end,
  cmd = "Trouble",
}
