-- LSP servers and clients communicate which features they support through "capabilities".
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in general for nvim-lspconfig:

return {
  'neovim/nvim-lspconfig',
  event = { 'BufNewFile', 'BufReadPre' },
  dependencies = {
    'saghen/blink.cmp',
    {
      "williamboman/mason.nvim",
      lazy = true,
      opts = {
        ui = {
          border = "rounded",
        },
      }
    },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- only used for disabling cmp in commented lines
    -- remove once blink.cmp has that feature
    "hrsh7th/nvim-cmp",
  },

  -- example using `opts` for defining servers
  opts = {
    servers = {
      bashls = {},
      lua_ls = {},
      -- js/ts
      html = {},
      emmet_language_server = {},
      ts_ls = {},
      cssls = {}, -- css/sass
      tailwindcss = {},
      -- C/C++
      clangd = {},
      -- Python
      pyright = {},
      -- vim
      vimls = {},
      -- toml
      taplo = {},
      -- Go
      gopls = {},
      -- Rust
      rust_analyzer = {},
    }
  },

  config = function(_, opts)
    require("mason").setup({})
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- lua
        "stylua",
        -- python
        "black",
        -- js, tsx, json, html etc
        "prettierd",
        -- go
        "gofumpt",
        -- rust
        "rustfmt",
        -- shell/bash
        "shfmt",
      }
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "lua_ls",
        -- js/ts
        "html",
        "emmet_language_server",
        "ts_ls",
        "cssls", -- css/sass
        "tailwindcss",
        -- C/C++
        "clangd",
        -- Python
        "pyright",
        -- vim
        "vimls",
        -- toml
        "taplo",
        -- Go
        "gopls",
        -- Rust
        "rust_analyzer",
      }
    })

    local map = vim.keymap.set
    map("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "LSP Declaration" })
    map("n", "gd", function() vim.lsp.buf.definition() end, { desc = "LSP Definition" })
    map("n", "K", function() vim.lsp.buf.hover() end, { desc = "LSP Hover" })
    map("n", "gi", function() vim.lsp.buf.implementation() end, { desc = "LSP Implementation" })
    map("n", "<leader>ls", function() vim.lsp.buf.declaration() end, { desc = "LSP Delcaration" })
    map("n", "<leader>D", function() vim.lsp.buf.type_definition() end, { desc = "LSP Type Definition" })
    map("n", "<leader>ra", function() require("nvchad.renamer").open() end, { desc = "LSP Rename" })
    map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "LSP Code Action" })
    map("n", "gr", function() vim.lsp.buf.references() end, { desc = "LSP References" })
    map("n", "<leader>lf", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "Diagnostics" })
    map("n", "[d", function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end,
      { desc = "Diagnostics previous" })
    map("n", "]d", function() vim.diagnostic.goto_next { float = { border = "rounded" } } end,
      { desc = "Diagnostics next" })
    map("n", "<leader>q", function() vim.diagnostic.setloclist() end, { desc = "Loclist" })
    map("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, { desc = "Add workspace folder" })
    map("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, { desc = "Remove workspace folder" })
    map("n", "<leader>wl", function() vim.lsp.buf.list_workspace_folder() end, { desc = "List workspace folders" })

    vim.diagnostic.config {
      -- virtual_text = { source = true },
      virtual_text = false,

      -- virtual_text = {
      -- float = { border = border },
      --   source = "always", -- Or "if_many"
      -- },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    }

    local border = "single"

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }
    require('lspconfig.ui.windows').default_options.border = 'single'

    -- LSP settings (for overriding per client)

    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      config.handlers = handlers
      lspconfig[server].setup(config)
    end
  end
}
