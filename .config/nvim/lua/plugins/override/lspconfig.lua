return {
  "neovim/nvim-lspconfig",
  init = function()
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
    map("n", "[d", function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, { desc = "Diagnostics previous" })
    map("n", "]d", function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, { desc = "Diagnostics next" })
    map("n", "<leader>q", function() vim.diagnostic.setloclist() end, { desc = "Loclist" })
    map("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, { desc = "Add workspace folder" })
    map("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, { desc = "Remove workspace folder" })
    map("n", "<leader>wl", function() vim.lsp.buf.list_workspace_folder() end, { desc = "List workspace folders" })
  end,
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities
    local on_attach = require("nvchad.configs.lspconfig").on_attach

    local servers = { "html", "cssls", "tsserver", "clangd", "emmet_language_server", "pyright", "tailwindcss" }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end

    lspconfig.emmet_language_server.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "eruby", "html", "javascript", "javascriptreact", "svelte", "pug", "typescriptreact", "vue" },
    }

    lspconfig.clangd.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
    }

    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      on_init = on_init,
      settings = {
        Lua = {
          hint = { enable = true },
          telemetry = { enable = false },
          --[[ diagnostics = { globals = { "bit", "vim", "it", "describe", "before_each", "after_each" } },
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          }, ]]
          -- NOTE: workspace libraries are set during bootstrapping via lazydev
        },
      },
    }

    local border = "rounded"
    -- :LspInfo
    local win = require "lspconfig.ui.windows"
    win.default_options = { border = border }

    vim.diagnostic.config {
      virtual_text = false,
      -- virtual_text = {
      float = { border = border },
      --   source = "always", -- Or "if_many"
      -- },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    }
    -- If you want diagnostics on errore hover
    -- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat lua guibg=#1f2335 guifg=#abb2bf]]
    -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
  end,
}
