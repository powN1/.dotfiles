return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({})

		-- Parsers to install
		local parsers = {
			"bash",
			"c",
			"cpp",
			"c_sharp",
			"css",
			"html",
			"http",
			"javascript",
			"json",
			"jsdoc",
			"go",
			-- "norg",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"toml",
			"typescript",
			"scss",
			"yaml",
			"vim",
			"vimdoc",
		}

		-- Install parsers asynchronously on startup
		-- (already-installed parsers are skipped, so this is cheap on subsequent launches)
		ts.install(parsers, { summary = false })

		-- Filetypes that should activate treesitter features
		-- Note: parser names sometimes differ from filetypes (e.g. c_sharp parser → cs filetype)
		local filetypes = {
			"bash",
			"sh",
			"c",
			"cpp",
			"cs", -- C# filetype uses c_sharp parser
			"css",
			"html",
			"http",
			"javascript",
			"javascriptreact",
			"json",
			"jsdoc",
			"go",
			"norg",
			"lua",
			"markdown",
			"python",
			"rust",
			"toml",
			"typescript",
			"typescriptreact",
			"scss",
			"yaml",
			"vim",
			"help", -- vimdoc uses 'help' filetype
		}

		-- File size limit for treesitter highlighting
		local max_filesize = 100 * 1024 -- 100 KB

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("user.treesitter", { clear = true }),
			pattern = filetypes,
			callback = function(args)
				local buf = args.buf

				-- Skip large files
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					vim.notify("File larger than 100KB, treesitter disabled for performance", vim.log.levels.WARN, { title = "Treesitter" })
					return
				end

				-- Enable highlighting
				pcall(vim.treesitter.start, buf)

				-- Indent (was disabled in your old config — keeping it disabled)
				-- Uncomment the next line if you want treesitter-based indenting:
				-- vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- Folding via treesitter (optional, not in your old config)
				-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- vim.wo.foldmethod = "expr"
			end,
		})

		-- Keep regex syntax highlighting alongside treesitter for markdown
		-- (was `additional_vim_regex_highlighting = { "markdown" }` in old API)
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("user.treesitter.markdown", { clear = true }),
			pattern = "markdown",
			callback = function()
				vim.bo.syntax = "ON"
			end,
		})

		-- Custom parser: templ
		-- The new API uses vim.treesitter.language.add() instead of registering via parsers config
		vim.treesitter.language.register("templ", "templ")
		-- Note: For custom parsers not in nvim-treesitter's registry, you'll need to install
		-- the parser manually or use a TSUpdate event hook. Most users now rely on the
		-- ~150 parsers shipped with nvim-treesitter. If templ isn't included, see:
		-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/doc/nvim-treesitter.txt
	end,
}
