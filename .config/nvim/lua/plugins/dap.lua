-- Debugging Adapter Protocol (DAP) plugins

local js_filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
}

return {
	-- Debug Adapter Protocol client implementation for Neovim
	{
		"mfussenegger/nvim-dap",
		event = "BufReadPost",
		dependencies = {
			"leoluz/nvim-dap-go",
			"nvim-neotest/nvim-nio",
			-- Lua adapter.
			{
				"jbyuki/one-small-step-for-vimkind",
				keys = {
					{
						"<leader>ll",
						function()
							require("osv").launch({ port = 8086 })
						end,
						desc = "Launch Lua adapter",
					},
				},
			},
			"rcarriga/nvim-dap-ui",

			-- An extension for nvim-dap, providing default configurations for python and methods to debug individual test methods or classes.
			{
				"mfussenegger/nvim-dap-python",
				lazy = true,
				event = { "BufNewFile", "BufReadPre" },
				config = function()
					local adapter_python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
					local dap_python = require("dap-python")
					dap_python.test_runner = "pytest"
					dap_python.setup(adapter_python_path)
				end,
			},

			"theHamsta/nvim-dap-virtual-text",
			-- Automatically install debug adapters for nvim-dap
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				automatic_installation = false,
				ensure_installed = { "js", "python", "codelldb", "delve" },
			})

			require("nvim-dap-virtual-text").setup({})

			require("dap-go").setup({
				dap_configurations = {
					{
						-- Must be "go" or it will be ignored by the plugin
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
			})

			dapui.setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = " ",
						pause = " ",
						play = " ",
						run_last = " ",
						step_back = " ",
						step_into = " ",
						step_out = " ",
						step_over = " ",
						terminate = " ",
					},
				},
			})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Set highlights and signs
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
			vim.fn.sign_define("DapStopped", { text = "󰁕 ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "" })
			vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

			--------------
			-- ADAPTERS --
			--------------
			-- Lua
			dap.adapters.nlua = function(callback, config)
				callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
			end

			-- Js/Ts
			for _, type in ipairs({ "chrome", "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost", "pwa-msedge" }) do
				dap.adapters[type] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						-- 💀 Make sure to update this path to point to your installation
						args = {
							vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"),
							"${port}",
						},
					},
				}
			end

			-- C/CPP/Rust/Zig
			dap.adapters.codelldb = {
				type = "executable",
				command = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/bin/codelldb"),
			}

			-------------
			-- CONFIGS --
			-------------
			-- Lua
			dap.configurations["lua"] = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}

			-- Js/Ts
			for _, language in ipairs(js_filetypes) do
				dap.configurations[language] = {
					-- Debug single nodejs files
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
						resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
					},
					-- Debug nodejs processes (make sure to add --inspect when you run the process)
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						sourceMaps = true,
					},
					-- Debug web applications (client side)
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch & Debug Chrome",
						url = function()
							local co = coroutine.running()
							return coroutine.create(function()
								vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:3000" }, function(url)
									if url == nil or url == "" then
										return
									else
										coroutine.resume(co, url)
									end
								end)
							end)
						end,
						-- Note: webRoot must be the root of the package, not the workspace.
						-- Consider automatically detecting this via package.json
						-- See: https://github.com/serranomorante/.dotfiles/blob/main/docs/nvim-dap-node-cli.md
						webRoot = vim.fn.getcwd(),
						sourceMaps = true,
					},

					-- Divider for the launch.json derived configs
					{
						name = "----- ↓ launch.json configs ↓ -----",
						type = "",
						request = "launch",
					},
				}
			end

			-- C/CPP/Rust/Zig
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
			dap.configurations.zig = dap.configurations.cpp
		end,

		keys = {
			{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint", },
			{ "<space>d?", function() require("dapui").eval(nil, { enter = true }) end, desc = "Eval under cursor", },
			{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional breakpoint", },
			{ "<space>gb", function() require("dap").run_to_cursor() end, desc = "Run to cursor", },
			{
				"<F1>",
				function()
					if vim.api.nvim_buf_get_option(0, "filetype") == "lua" then
						require("osv").launch({ port = 8086 })
						require("osv").run_this()
					else
						return require("dap").continue()
					end
				end,
				desc = "Debug continue",
			},
			{ "<F2>", function() require("dap").step_into() end, desc = "Debug step into", },
			{ "<F3>", function() require("dap").step_over() end, desc = "Debug step over", },
			{ "<F4>", function() require("dap").step_out() end, desc = "Debug step out", },
			{ "<F5>", function() require("dap").step_back() end, desc = "Debug step back", },
			{ "<F6>", function() require("dapui").toggle({ reset = true }) require("dapui").toggle({ reset = true }) end, desc = "Debug reset ui", },
			{
				"<leader>da",
				function()
					if vim.fn.filereadable(".vscode/launch.json") then
						require("dap.ext.vscode").load_launchjs()
					end
					require("dap").continue()
				end,
				desc = "Debug attach",
			},
			{ "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Debug log point message", },
			{ "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Debug run to cursor", },
			{ "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Debug widgets", },
			{ "<leader>dc", function() require("dap").clear_breakpoints() end, desc = "Debug clear breakpoints", },
			{ "<leader>dt", function() require("dap").terminate() require("dapui").close() end, desc = "Debug terminate", },
		},
	},
}
