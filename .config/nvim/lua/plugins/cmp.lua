return {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	lazy = true,
	dependencies = {
		{
			-- snippet plugin
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			event = "BufReadPre",
		},
		{ "rafamadriz/friendly-snippets", event = "BufReadPre" },
		-- nvim-autopairs for automatic brackets when autocompleting
		{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	},
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- Disable cmp for comments
		enabled = function()
			local in_prompt = vim.api.nvim_buf_get_option(0, "buftype") == "prompt"
			local in_oil = vim.api.nvim_buf_get_option(0, "filetype") == "oil"
			if in_prompt or in_oil then -- Disable cmp in telescope and oil
				return false
			end

			local context = require("cmp.config.context")
			return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
		end,
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			preset = "enter",
			["<Tab>"] = {
				function(cmp)
					if vim.fn.mode() == "c" then
						-- Show menu and select first (since blink.cmp is not providing the method to do it yet)
						if cmp.is_visible() == false then
							local next = function()
								return cmp.select_next()
							end
							return cmp.show({ callback = next })
						end
					end
				end,
				"snippet_forward",
				"select_next",
				"fallback",
			},
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
					kind_resolution = {
						enabled = true,
						-- By default its excluding tsx, jsx and vue files from automatic brackets
						-- when completing methods etc
						blocked_filetypes = {},
					},
				},
			},

			-- Dont autoselect the option only when clicked
			list = {
				-- selection = function(ctx)
				-- 	return ctx.mode == "cmdline" and "auto_insert" or "auto_insert"
				-- end,
				selection = "auto_insert",
				max_items = 25,
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				update_delay_ms = 0,
				treesitter_highlighting = true,
				window = {
					border = "single",
				},
			},

			menu = {
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline"
				end,
				border = "single",
				draw = {
					padding = { 1, 1 },
					columns = { { "kind_icon", "label", "source_name", gap = 1 } },
					components = {
						source_name = {
							text = function(ctx)
								return "[" .. ctx.source_name .. "]"
							end,
						},
					},
				},
			},
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
