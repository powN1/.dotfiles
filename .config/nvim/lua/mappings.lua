local map = vim.keymap.set

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("v", "y", "ygv<Esc>", { desc = "Yank preventing cursor from jumping back to where selection started" })

map("v", "<", "<gv", { desc = "Indent" })
map("v", ">", ">gv", { desc = "Indent" })

-- This is one is in better escape plugin
-- map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

map("n", "<leader>of", function()
	-- 	vim.ui.open(vim.fn.expand("%:p:h"))

	-- Execute the 'explorer.exe .' command with the current directory
	os.execute("explorer.exe .")
end, { desc = "Open file location in Windows Explorer" })

-- Switch between windows
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Navigate in insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Move lines
map("n", "<A-j>", ":m+<CR>", { desc = "Move line down" })
map("n", "<A-k>", ":m-2<CR>", { desc = "Move line up" })
map("i", "<A-j>", "<ESC><cmd>:m.+1<CR>", { desc = "Move line down" })
map("i", "<A-k>", "<ESC><cmd>:m.-2<CR>", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Cursor stays in one place when joining lines
map("n", "J", "mzJ`z")

-- Keep searches in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Buffer navigation
map("n", "<Tab>", "<cmd>:bnext<CR>")
map("n", "<S-Tab>", "<cmd>:bprev<CR>")
map("n", "<leader>x", "<cmd>:bd<CR>")

-- Save
map({ "n", "i", "v" }, "<C-s>", "<ESC><cmd>w<CR>", { desc = "Save file" })

-- Copy whole file
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- terminal
  map("t", "<C-q>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- These mappings control the size of splits (height/width)
-- Disabled for now as I use smart-splits for that
-- map("n", "<C-Left>", "<c-w>5<")
-- map("n", "<C-Right>", "<c-w>5>")
-- map("n", "<C-Up>", "<C-W>+")
-- map("n", "<C-Down>", "<C-W>-")
