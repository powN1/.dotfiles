return {
  "christoomey/vim-tmux-navigator",
  init = function()
    local map = vim.keymap.set
    map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Window Left" })
    map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Window Down" })
    map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Window Up" })
    map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Window Right" })
  end,
  lazy = false,
}
