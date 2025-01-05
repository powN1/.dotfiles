local opt = vim.opt
opt.clipboard = "unnamedplus"

-- opt.cursorline = true
-- opt.cursorlineopt = "both"

----------------- Statusline -----------------
function _G.open_buffer_count()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	return #buffers
end

--               |
function _G.git_branch()
	local branch = vim.fn.system("git branch --show-current 2>/dev/null")
	return branch:gsub("\n", "")
end

function _G.centered_statusline()
	local bufferCount = open_buffer_count()
	local filePath = vim.fn.expand("%f%m")
	local center = "(" .. bufferCount .. ") " .. filePath

	local branch = git_branch()
	local left = "  " .. branch
	if branch == "" then
		left = ""
	end

	local width = vim.o.columns
	local left_width = vim.fn.strwidth(left) -- Width of the left content
	local center_width = vim.fn.strwidth(center)

	local padding = ((width - left_width - center_width) / 2 - (left_width / 2))

	-- Build the statusline
	return left .. string.rep(" ", padding) .. center
end

-- Set the statusline
-- vim.o.statusline = "%=(%{v:lua.open_buffer_count()}) %f%m%="
vim.o.statusline = "%!v:lua.centered_statusline()"

-- vim.api.nvim_set_hl(0, "Statusline", { fg = "#eeeeee" })
----------------------------------------------

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
-- opt.autoindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Splits
opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

opt.signcolumn = "yes"
opt.termguicolors = true

opt.laststatus = 3 -- global statusline

opt.undofile = true

opt.swapfile = false
opt.backup = false

-- interval for writing swap file to disk, also used by gitsigns

opt.updatetime = 250

-- Enable vim incrementation for letters aswell
opt.nrformats:append("alpha")

-- UFO
-- Disabled in order for UFO chevrons to work
-- opt.fillchars = { eob = " " }
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- When entering next line from a comment line, don't make it a comment
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
	pattern = { "*" },
	callback = function()
		vim.opt_local.fo:remove("o")
		vim.opt_local.fo:remove("r")
	end,
})
