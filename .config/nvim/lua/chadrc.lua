-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- Define the CenterFilePath function
function CenterFilePath()
  local width = vim.fn.winwidth(0)  -- Get current window width
  local filepath = vim.fn.expand('%:p')  -- Full file path
  local filepath_len = #filepath
  local padding = math.floor((width - filepath_len) / 2)  -- Calculate padding on both sides
  
  -- Return the centered file path with spaces
  return string.rep(' ', padding) .. filepath .. string.rep(' ', padding)
end

M.base46 = {
	theme = "onedark",
	transparency = true,
	nvdash = {
		load_on_startup = not VSCodeRunning,
		header = {
			"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
			"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
			"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
			"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
			"          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
			"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
			"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
			" ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
			" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
			"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
			"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
			"     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ",
			"     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ",
			"     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ",
		},
	},
	hl_override = {
		Comment = { italic = false },
		["@comment"] = { italic = false },

		-- Color of the current line when editing
		CursorLine = { bg = { "one_bg3", -0 } },
		-- CursorLineNr = { bg = "#333999" },
		-- ColorColumn = { bg = "#99ff22" },
		-- Cursor = { bg = "#ffffff" },

		-- Color of the current line when selecting files in telescope
		TelescopeSelection = { fg = "#dddddd", bg = "one_bg3" },

		-- UFO arrows
		FoldColumn = { fg = "#777777", bg = "NONE" },

		TbBufOn = { bg = { "one_bg3", 2 } },
		TbBufOnClose = { bg = { "one_bg3", 2 } },
		TbBufOnModified = { bg = { "one_bg3", 2 } },

		-- TblineFill = { bg = "#ccc222", fg = "white" },
		-- TbLineBufOn = { bg = "#ccc222", fg = "white" },
		-- TbLineTabOn = { bg = "#ccc222", fg = "white" },
		-- TbLineBufOff = { bg = "#ccc222", fg = "white" },
		-- TbLineTabOff = { bg = "#ccc222", fg = "white" },
		-- TblineTabNewBtn = { bg = "#ccc222", fg = "white" },
		-- TbLineBufOnClose = { bg = "#ccc222", fg = "white" },
		-- TbLineBufOffClose = { bg = "#ccc222", fg = "white" },
		-- TbLineTabCloseBtn = { bg = "#ccc222", fg = "white" },
		-- TbLineBufOnModified = { bg = "#ccc222", fg = "white" },
		-- TbaLineBufOffModified = { bg = "#ccc222", fg = "white" },
		-- TbLineThemeToggleBtn = { bg = "#ccc222", fg = "white" },
		-- TBTabTitle = { bg = "#ccc222", fg = "white" },
		-- TbLineBufOffModified = { bg = "#ccc222", fg = "white" },
		-- TbLineCloseAllBufsBtn = { bg = "#ccc222", fg = "white" },

		-- Set colons and brackets to grayish color (variables color)
		["@punctuation.delimiter"] = { link = "variable" },
		["@punctuation.bracket"] = { link = "variable" },
		["@tag.delimiter"] = { link = "variable" },

		-- Floating window for lsp.hover() (shift+k)
		-- ["NormalFloat"] = { bg = { "one_bg3", -3 } },

		-- Color of the file path in statusline
		St_EmptySpace = { fg = "#aaaaaa", bg = "NONE" },
	},
	hl_add = {
		-- LeapBackdrop = { link = "Comment" },
		-- Highlights not related strictly to nvchad
		["@keyword.import"] = { link = "@keyword.return" },
		["RainbowDelimiterYellow"] = { fg = "#e5c100" },
		["RainbowDelimiterBlue"] = { fg = "#179FFF" },
		["RainbowDelimiterGreen"] = { fg = "#0ac007" },
		["RainbowDelimiterViolet"] = { fg = "#DA70D6" },
		["RainbowDelimiterCyan"] = { fg = "#38dcdd" },
	},
}
M.ui = {
	-- check :h nvui for options
	statusline = {
		theme = "default",
		separator_style = "block",
		order = { "mode", "git", "%=", "modified", "filePath", "%=", "lsp_msg", "%=", "lsp", "cwd" },
		modules = {
			-- abc = function()
			--   return ""
			-- end,
			filePath = "%f",
			fileName = "%t",
			modified = "%m",
		},
	},

	cmp = {
		-- style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			tailwind = true,
		},
	},

	telescope = { style = "bordered" }, -- borderless / bordered
}
-- Display only "mode" when neovim is run in vscode
-- if VSCodeRunning then
--   M.ui.statusline = {
--     order = { "mode" },
--   }
-- end

return M
