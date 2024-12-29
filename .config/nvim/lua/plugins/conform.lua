return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    init = function()
      vim.keymap.set("n", "<leader>fm", function()
        require("conform").format { lsp_fallback = true }
        -- require("conform").formatters.lua = { prepend_args = { "--column-width", "170" } }
      end, { desc = "Format files" })
    end,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },

        c = { "clang-format" },
        cpp = { "clang-format" },

        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        sass = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        markdown = { "prettierd" },
        yaml = { "prettierd" },

        toml = { "taplo" },
        sh = { "shfmt" },
        python = { "black" },
        go = { "gofumpt" },
        rust = { "rustfmt" },
      },
      -- Custom configs for formatters
      formatters = {
        stylua = { prepend_args = { "--column-width", "140" } },
        prettierd = {
          command = "prettierd",
          args = { "--stdin-filepath", "$FILENAME" }, -- Ensure only one file is passed
          stdin = true,                               -- Pass content via stdin
          env = {
            -- Path to the .prettierd.json in nvim directory
            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand(vim.fn.stdpath("config") .. "/prettierrc.json"),
          },
        },
      },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
