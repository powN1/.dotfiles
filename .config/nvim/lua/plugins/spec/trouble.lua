return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufReadPost",
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>te", "<cmd>TroubleToggle<CR>", { desc = "Toggle trouble" })
  end,
}
