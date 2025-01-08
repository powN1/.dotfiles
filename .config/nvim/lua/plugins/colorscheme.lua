return {
	"olimorris/onedarkpro.nvim",
	-- lazy = false,
	-- priority = 1000,
	dependencies = {
		{ "xiyaowong/transparent.nvim" },
		{ "rose-pine/neovim", name = "rose-pine" },
		"rafi/awesome-vim-colorschemes",
	},
	init = function()
		-- require("rose-pine").setup({
		--   styles = {
		--     bold = true,
		--     italic = false,
		--     transparency = false,
		--   },
		-- })
		require("transparent").setup({
			extra_groups = {
				"NormalFloat",
				"FloatBorder",
				"FloatTitle",
				"TelescopeBorder",
				"TelescopeNormal",
				"TelescopePromptNormal",
				"NvimTree",
				"BlinkCmpMenuBorder",
				"Pmenu",
				"Folded",
				"FoldColumn",
				"TabLine",
				"TabLineFill",
				-- "TabLineSel",
			},
		})
		vim.cmd.colorscheme("rose-pine-moon")

		local enableTransparency = function()
			-- vim.api.nvim_set_hl(0, ["@text.emphasis"] = { cterm = "false" })
			vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "ColorColumn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "SignColumnNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "LineNrNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
			vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#777777", bg = "NONE" })
			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "PmenuKind", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" })

			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "IblIndent", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "IblScope", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "IblWhitespace", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "MiniPickPrompt", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "MiniPickBorderText", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })

			--    vim.api.nvim_set_hl(0, "ColorColumn", {bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Conceal", {bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Cursor", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "CursorLineNrNC", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "CursorLineNrNCQuickFix", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Directory", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "DiffChange", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "DiffText", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "ErrorMsg", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "FoldedNC", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "SignColumnNC", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Substitute", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "MsgSeparator", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "MoreMsg", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Question", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "QuickFixLine", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Search", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "IncSearch", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "TermCursor", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "TermCursorNC", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Title", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Visual", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "VisualNOS", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "WarningMsg", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "Whitespace", { bg = "NONE" })
			--    vim.api.nvim_set_hl(0, "WildMenu", { bg = "NONE" })

			-- Git
			-- vim.api.nvim_set_hl(0, "diffFile", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "diffNewFile", { bg = "NONE" })
			-- vim.api.nvim_set_hl(0, "diffLine", { bg = "NONE" })

			-- Spelling
			--vim.api.nvim_set_hl(0, "SpellBad", { bg = "NONE" })
			--vim.api.nvim_set_hl(0, "SpellCap", { bg = "NONE" })
			--vim.api.nvim_set_hl(0, "SpellLocal", { bg = "NONE" })
			--vim.api.nvim_set_hl(0, "SpellRare", { bg = "NONE" })
		end

		local disableItalic = function()
			-- Get all highlight groups with "gui" set to "italic"
			local function get_italic_highlights()
				local highlights = {}
				-- Iterate over all highlight groups
				for _, name in ipairs(vim.fn.getcompletion("", "highlight")) do
					-- Get the highlight properties
					local hl = vim.api.nvim_get_hl(0, { name = name })
					-- Check if "italic" is set in the "italic" field or "gui" field
					if hl.italic or (hl.gui and hl.gui:find("italic")) then
						table.insert(highlights, name)
					end
				end
				return highlights
			end

			local function remove_italic_gui()
				local italic_highlights = get_italic_highlights()
				for _, name in ipairs(italic_highlights) do
					-- if name == "Comment" then
					--   return
					-- end
					-- Get current highlight properties
					local hl = vim.api.nvim_get_hl(0, { name = name })
					-- Set the highlight with "gui" removed
					vim.api.nvim_set_hl(0, name, {
						fg = hl.fg,
						bg = hl.bg,
						sp = hl.sp,
						bold = hl.bold,
						underline = hl.underline,
						undercurl = hl.undercurl,
						strikethrough = hl.strikethrough,
						reverse = hl.reverse,
						standout = hl.standout,
						blend = hl.blend,
						italic = false, -- Explicitly remove italics
					})
				end
			end

			remove_italic_gui()
		end

		-- enableTransparency()
		disableItalic()
	end,
}
