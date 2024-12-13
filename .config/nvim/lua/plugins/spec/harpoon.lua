return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		local harpoon = require("harpoon")
		local map = vim.keymap.set

		harpoon:setup()

		map("n", "<leader>a", function() harpoon:list():add() end)
		map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		map("n", "<C-1>", function() harpoon:list():select(1) end)
		map("n", "<C-2>", function() harpoon:list():select(2) end)
		map("n", "<C-3>", function() harpoon:list():select(3) end)
		map("n", "<C-4>", function() harpoon:list():select(4) end)

		-- Toggle previous & next buffers stored within Harpoon list
		map("n", "<C-S-P>", function() harpoon:list():prev() end)
		map("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}
