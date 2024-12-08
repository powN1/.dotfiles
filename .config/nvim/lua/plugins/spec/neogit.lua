return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },
  init = function ()
    local map = vim.keymap.set

    map("n", "<leader>ng", "<cmd>Neogit<cr>", { desc = "Neogit open" })
  end,
  config = true,
  lazy = false
}
