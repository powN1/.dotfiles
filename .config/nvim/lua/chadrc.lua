-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local VSCodeRunning = false
VSCodeRunning = vim.g.vscode and true or false

M.ui = {
  transparency = true,
  theme = "onedark",
  -- statusline = {
  --   order = ""
  -- },
  nvdash = {
    load_on_startup = not VSCodeRunning,
    header = {
      "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
      "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
      "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
      "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
      "          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
      "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
      "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
      " ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
      " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
      "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
      "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
      "     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ",
      "     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ",
      "     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ",
    },
  },

  hl_override = {
    Comment = { italic = false },
    ["@comment"] = { italic = false },

    -- Color of the current line when editing
    CursorLine = { bg = { "one_bg3", -0 } },
    -- CursorLineNr = { bg = "#333999" },
    -- ColorColumn = { bg = "#99ff22" },
    -- Cursor = { bg = "#ffffff" },

    -- Color of the current line when selecting files in telescope
    TelescopeSelection = { bg = "one_bg3" },

    -- UFO arrows
    FoldColumn = { fg = "#777777", bg = "NONE" },

    TblineFill = { bg = "#ccc222", fg = "white" },
    TbLineBufOn = { bg = "#ffffff" },
    TbLineBufOnClose = { bg = { "one_bg3", 0 } },
    TbLineBufOnModified = { bg = { "one_bg3", 0 } },

    -- TblineFill = { bg = "#ccc222", fg = "white" },
    -- TbLineBufOn = { bg = "#ccc222", fg = "white" },
    -- TbLineTabOn = { bg = "#ccc222", fg = "white" },
    -- TbLineBufOff = { bg = "#ccc222", fg = "white" },
    -- TbLineTabOff = { bg = "#ccc222", fg = "white" },
    -- TblineTabNewBtn = { bg = "#ccc222", fg = "white" },
    -- TbLineBufOnClose = { bg = "#ccc222", fg = "white" },
    -- TbLineBufOffClose = { bg = "#ccc222", fg = "white" },
    -- TbLineTabCloseBtn = { bg = "#ccc222", fg = "white" },
    -- TbLineBufOnModified = { bg = "#ccc222", fg = "white" },
    -- TbaLineBufOffModified = { bg = "#ccc222", fg = "white" },
    -- TbLineThemeToggleBtn = { bg = "#ccc222", fg = "white" },
    -- TBTabTitle = { bg = "#ccc222", fg = "white" },
    -- TbLineBufOffModified = { bg = "#ccc222", fg = "white" },
    -- TbLineCloseAllBufsBtn = { bg = "#ccc222", fg = "white" },

    -- Set colons and brackets to grayish color (variables color)
    ["@punctuation.delimiter"] = { link = "variable" },
    ["@punctuation.bracket"] = { link = "variable" },
    ["@tag.delimiter"] = { link = "variable" },
  },
  hl_add = {
    -- Highlights not related strictly to nvchad
    ["@keyword.import"] = { link = "@keyword.return" },
    ["RainbowDelimiterYellow"] = { fg = "#e5c100" },
    ["RainbowDelimiterBlue"] = { fg = "#179FFF" },
    ["RainbowDelimiterGreen"] = { fg = "#0ac007" },
    ["RainbowDelimiterViolet"] = { fg = "#DA70D6" },
    ["RainbowDelimiterCyan"] = { fg = "#38dcdd" },
  },
}

M.base46 = {
  integrations = {
    "tbline"
  }
}
-- In order for react snippets to work in .js files I had to add change
-- .local/share/nvim/lazy/friendly-snippets/package.json file
-- and connect "react.json" to "javascript" files.

-- Display only "mode" when neovim is run in vscode
-- if VSCodeRunning then
--   M.ui.statusline = {
--     order = { "mode" },
--   }
-- end

return M
