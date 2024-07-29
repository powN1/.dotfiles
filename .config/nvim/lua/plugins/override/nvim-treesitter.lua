return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/playground" },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "html",
      "http",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "scss",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
    },
    auto_install = true,
    indent = { 
      enable = true,
      disable = { "html" }
    },
    highlight = { enable = true },
    playground = { enable = true}
  },
}
