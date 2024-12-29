local plugins = {}

table.insert(plugins, { import = "plugins.treesitter" })
table.insert(plugins, { import = "plugins.cmp" })
table.insert(plugins, { import = "plugins.lspconfig" })
table.insert(plugins, { import = "plugins.telescope" })
table.insert(plugins, { import = "plugins.colorscheme" })
table.insert(plugins, { import = "plugins.oil" })
table.insert(plugins, { import = "plugins.conform" })
table.insert(plugins, { import = "plugins.obsession" }) -- session manager
table.insert(plugins, { import = "plugins.comment" })
table.insert(plugins, { import = "plugins.rainbow-delimiters" }) -- rainbow brackets
table.insert(plugins, { import = "plugins.nvim-surround" })
table.insert(plugins, { import = "plugins.smart-splits" }) -- smart resizing windows
table.insert(plugins, { import = "plugins.blankline" })
table.insert(plugins, { import = "plugins.whichkey" }) -- key help
table.insert(plugins, { import = "plugins.better-escape" }) -- better escaping with 
table.insert(plugins, { import = "plugins.ts-autotag" }) -- autocloing html tags
table.insert(plugins, { import = "plugins.vim-tmux-navigator" }) -- navigation between vim and tmux
table.insert(plugins, { import = "plugins.trouble" })
table.insert(plugins, { import = "plugins.nvim-colorizer" })
table.insert(plugins, { import = "plugins.ufo" })
table.insert(plugins, { import = "plugins.harpoon" })
table.insert(plugins, { import = "plugins.markdown-preview" })
table.insert(plugins, { import = "plugins.dap" })
-- table.insert(plugins, { import = "plugins.statusline" })
-- table.insert(plugins, { import = "plugins.spec.live-server" })
-- table.insert(plugins, { import = "plugins.spec.neogit" })
-- table.insert(plugins, { import = "plugins.spec.todo-comments" })
-- table.insert(plugins, { import = "plugins.spec.leap" })
-- table.insert(plugins, { import = "plugins.override.luasnip" })

return plugins
