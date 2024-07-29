return {
  "echasnovski/mini.files",
  version = "*",
  lazy = false,
  init = function()
    local map = vim.keymap.set
    -- ["-"] = { "<cmd> Oil<CR>", "Open parent directory" },
    map({ "n" }, "=", "<cmd>lua MiniFiles.open()<CR>", { desc = "" })
  end,
  config = function()
    require("mini.files").setup()
  end,
}
