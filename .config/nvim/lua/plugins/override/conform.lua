return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    init = function()
      vim.keymap.set("n", "<leader>fm", function()
        require("conform").format { lsp_fallback = true }
        require("conform").formatters.lua = { prepend_args = { "--column-width", "170" } }
      end, { desc = "Format files" })
    end,
    opts = {
      formatters_by_ft = {
        -- clang should work by default
        css = { "prettierd" },
        scss = { "prettierd" },
        html = { "prettierd" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        markdown = { "prettierd" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        lua = { "stylua" },
        toml = { "taplo" },
      },
      -- Custom configs for formatters
      formatters = {
        stylua = { prepend_args = { "--column-width", "140" } },
      },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
