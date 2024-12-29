return {
  "numToStr/Comment.nvim",
  lazy = true,
  event = "BufReadPre",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      lazy = true,
      event = "BufReadPre",
      config = function()
        require("ts_context_commentstring").setup {
          enable_autocmd = false,
        }
      end
    },
  },
  config = function()
    local comment = require "Comment"
    local ts_addon = require "ts_context_commentstring.integrations.comment_nvim"

    comment.setup { pre_hook = ts_addon.create_pre_hook() }

    -- Improve Astro commenting and add support for Sass
    local ft = require "Comment.ft"
    ft.set("scss", { "//%s", "/*%s*/" })
    ft.set("astro", { "<!--%s-->", "<!--%s-->" })
    local map = vim.keymap.set
    local api = require "Comment.api"

    -- windows(os) can't really tell a difference between "C-/" and "C-_" therefore bound the same action to both keystrokes
    -- map("n", "<C-_>", "gcc", { desc = "comment toggle", remap = true })
    -- map("v", "<C-/>", "gc", { desc = "comment toggle", remap = true })
    map("n", "<C-_>", function() api.toggle.linewise.current() end, { desc = "Toggle comment" })
    map("n", "<C-/>", function() api.toggle.linewise.current() end, { desc = "Toggle comment" })

    map("v", "<C-_>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Comment toggle" })
    map("v", "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Comment toggle" })
  end,
}