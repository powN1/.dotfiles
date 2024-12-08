return {
  "L3MON4D3/LuaSnip",
  config = function()
    require "nvchad.configs.luasnip"

    local map = vim.keymap.set
    local ls = require "luasnip"
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local fmt = require("luasnip.extras.fmt").fmt

    require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.fn.stdpath "config" .. "/snippets/vscode" } }

    -- Function to check if 'useState' import exists
    -- local function ensure_useState_import()
    --   local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    --   for _, line in ipairs(lines) do
    --     if line:match "import {.*useState.*} from 'react'" then
    --       return ""
    --     end
    --   end
    --   return "import { useState } from 'react';\n\n"
    -- end

    -- Define your snippets
    -- ls.add_snippets("javascriptreact", {
    --   s(
    --     "us",
    --     fmt(
    --       [[
    -- {}const [{}, set{}] = useState({});
    -- ]],
    --       {
    --         f(ensure_useState_import, {}),
    --         i(1, "state"),
    --         i(2, "State"),
    --         i(3, "initialValue"),
    --       }
    --     )
    --   ),
    -- })

    map({ "s", "i" }, "<C-y>", function()
      ls.expand()
    end, { desc = "Luasnip confirm snippet" })

    -- map({ "s", "i" }, "<C-j>", function()
    --   ls.jump(-1)
    -- end, { desc = "Luasnip jump backward" })
    --
    -- map({ "s", "i" }, "<C-k>", function()
    --   ls.jump(1)
    -- end, { desc = "Luasnip jump forward" })

    -- vim.keymap.set({ "i", "s" }, "<C-e>", function()
    --   if ls.choice_active() then
    --     ls.change_choice(1)
    --   end
    -- end, { desc = "Luasnip change active choice" })
  end,
}
