require "nvchad.options"

local opt = vim.opt
VSCodeRunning = vim.g.vscode and true or false

-- -------------------------------------- options ------------------------------------------
-- Disable statusline for vscode
opt.laststatus = VSCodeRunning and 0 or 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorlineopt = "both"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Disabled in order for UFO chevrons to work
-- opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"


opt.pumheight = 13
opt.relativenumber = true

-- UFO
opt.foldcolumn = "1"
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]


-- This command makes sure that when you navigate to the next line (with o) when you are on a commented line
-- that the next line is not a comment (lua and js files).
local group = vim.api.nvim_create_augroup("CustomFormatOptions", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    group = group,
    callback = function()
        vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"c", "r", "o"}
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    group = group,
    callback = function()
        vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"c", "r", "o"} + {"t"}
    end,
})
