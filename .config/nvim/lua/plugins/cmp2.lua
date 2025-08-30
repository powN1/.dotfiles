return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	-- jsregexp is needed for snippets to be able to capitalize letters (setState for example)
	build = "make install_jsregexp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		{
			"L3MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets",
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
		},
		-- { "hrsh7th/cmp-cmdline" },
	},
	config = function()
		require("cmp").setup({
			performance = {
				max_view_entries = 7,
			},
			sources = {
				{ name = "nvim_lsp", trigger_characters = { "-" } },
				{ name = "luasnip" },
				{ name = "buffer", keyword_length = 4 },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "cmdline" },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end,
}
