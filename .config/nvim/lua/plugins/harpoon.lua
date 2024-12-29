return {
  "ThePrimeagen/harpoon",
  event = { 'BufNewFile', 'BufReadPre' },
  lazy = true,
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local map = vim.keymap.set

    harpoon:setup()

    map("n", "<leader>a", function() harpoon:list():add() end)
    map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    map("n", "<leader>1", function() harpoon:list():select(1) end)
    map("n", "<leader>2", function() harpoon:list():select(2) end)
    map("n", "<leader>3", function() harpoon:list():select(3) end)
    map("n", "<leader>4", function() harpoon:list():select(4) end)
    map("n", "<leader>5", function() harpoon:list():select(5) end)
    map("n", "<leader>6", function() harpoon:list():select(6) end)
    map("n", "<leader>7", function() harpoon:list():select(7) end)
    map("n", "<leader>8", function() harpoon:list():select(8) end)
    map("n", "<leader>9", function() harpoon:list():select(9) end)
    map("n", "<leader>0", function() harpoon:list():select(0) end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- map("n", "<S-Tab>", function() harpoon:list():prev() end)
    -- map("n", "<Tab>", function() harpoon:list():next() end)
  end,
}
