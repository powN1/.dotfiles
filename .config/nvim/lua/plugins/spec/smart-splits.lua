return { 
  "mrjones2014/smart-splits.nvim",
  init = function()
    local map = vim.keymap.set
    -- Smart splits
    map("n", "<C-Left>", function() require("smart-splits").resize_left(2) end)
    map("n", "<C-Down>", function() require("smart-splits").resize_down(2) end)
    map("n", "<C-Up>", function() require("smart-splits").resize_up(2) end)
    map("n", "<C-Right>", function() require("smart-splits").resize_right(2) end)
    map("n", "<A-Left>", function() require("smart-splits").swap_buf_left() end)
    map("n", "<A-Down>", function() require("smart-splits").swap_buf_down() end)
    map("n", "<A-Up>", function() require("smart-splits").swap_buf_up() end)
    map("n", "<A-Right>", function() require("smart-splits").swap_buf_right() end)
  end
}
