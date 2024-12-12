local term = require("nvchad.term")

function _G.open_dev_servers()
	-- Open a vertical split for the client terminal
	term.runner({
		pos = "sp", -- vertical split
		cmd = "cd client && npm run dev && exit", -- Client command
		id = "client_terminal", -- Unique ID for terminal 1
		clear_cmd = false,
	})

  -- Hide terminal
	term.toggle({ pos = "sp", id = "client_terminal" })

	-- Open another terminal for the server command
	term.runner({
		pos = "sp", -- vertical split again
		cmd = "cd server && nodemon server && exit", -- Server command
		id = "server_terminal", -- Unique ID for terminal 2
		clear_cmd = false,
	})

  -- Hide terminal
	term.toggle({ pos = "sp", id = "server_terminal" })

  -- Exit terminal mode after hiding the terminal (back to normal mode)
  vim.api.nvim_input("<C-\\><C-n>") -- Exit terminal mode
end

-- Create a command that runs the function to open both terminals
vim.cmd("command! OpenDevServers lua open_dev_servers()")
