local plugins = {}

-- Run those plugins when vscode is not open
if not vim.g.vscode then
  table.insert(plugins, { import = "plugins.override.nvim-tree" })
  table.insert(plugins, { import = "plugins.override.nvim-treesitter" })
  table.insert(plugins, { import = "plugins.spec.live-server" })
  table.insert(plugins, { import = "plugins.spec.rainbow-delimiters" })
  table.insert(plugins, { import = "plugins.spec.smart-splits" })
  table.insert(plugins, { import = "plugins.spec.oil" })
  table.insert(plugins, { import = "plugins.spec.vim-tmux-navigator" })
  table.insert(plugins, { import = "plugins.spec.ts-autotag" })
  table.insert(plugins, { import = "plugins.spec.obsession" })
  table.insert(plugins, { import = "plugins.spec.ufo" })
  table.insert(plugins, { import = "plugins.spec.trouble" })
  table.insert(plugins, { import = "plugins.override.nvim-colorizer" })
  table.insert(plugins, { import = "plugins.override.telescope" })
  table.insert(plugins, { import = "plugins.spec.comment" })
  table.insert(plugins, { import = "plugins.spec.ts-context-commentstring" })
  table.insert(plugins, { import = "plugins.spec.rainbow-delimiters" })
  table.insert(plugins, { import = "plugins.override.whichkey" })
  table.insert(plugins, { import = "plugins.spec.mini-files" })
  table.insert(plugins, { import = "plugins.spec.neogit" })
end

-- Run at all times
table.insert(plugins, { import = "plugins.override.cmp" })
table.insert(plugins, { import = "plugins.override.conform" })
table.insert(plugins, { import = "plugins.override.lspconfig" })
table.insert(plugins, { import = "plugins.override.mason" })
table.insert(plugins, { import = "plugins.override.blankline" })
table.insert(plugins, { import = "plugins.override.luasnip" })
table.insert(plugins, { import = "plugins.spec.better-escape" })
table.insert(plugins, { import = "plugins.spec.leap" })

return plugins
