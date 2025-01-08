return {
	"catgoose/nvim-colorizer.lua",
	event = { "BufNewFile", "BufReadPre" },
	lazy = true,
	config = function()
		vim.opt.termguicolors = true
		require("colorizer").setup({
			user_default_options = {
				css = true, -- Enable all CSS *features*:
				-- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Highlighting mode.  'background'|'foreground'|'virtualtext'
				mode = "virtualtext", -- Set the display mode
				-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True is same as normal
				tailwind = true, -- Enable tailwind colors
				-- parsers can contain values used in |user_default_options|
				sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
				-- Virtualtext character to use
				virtualtext = "■",
				-- Display virtualtext inline with color
				virtualtext_inline = true,
				-- Virtualtext highlight mode: 'background'|'foreground'
				virtualtext_mode = "foreground",
				-- update color values even if buffer is not focused
				-- example use: cmp_menu, cmp_docs
				always_update = false,
			},
			user_commands = true, -- Enable all or some usercommands
		})
	end,
}
