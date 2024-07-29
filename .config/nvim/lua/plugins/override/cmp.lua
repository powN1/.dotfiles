
local cmp = require "cmp"

dofile(vim.g.base46_cache .. "cmp")

local cmp_ui = require("nvconfig").ui.cmp
local cmp_style = cmp_ui.style

local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}

local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

  format = function(_, item)
    local icons = require "nvchad.icons.lspkind"
    local icon = (cmp_ui.icons and icons[item.kind]) or ""

    -- A function to check which specific lsp is active (tsserver, emmet etc)
    -- so it can be displayed in a dropdown menu when autocompleting.

    local lspserver_name = ""
    local function checkLspName()
      if _.source.name == "nvim_lsp" then
        -- Display which LSP servers this item came from.
        pcall(function()
          local lspName = _.source.source.client.name
          if lspName == "tsserver" then
            lspserver_name = "TSS"
          elseif lspName == "emmet_language_server" then
            lspserver_name = "Emmet"
          else
            lspserver_name = _.source.source.client.name
          end
        end)
      end
    end
    checkLspName()

    if cmp_style == "atom" or cmp_style == "atom_colored" then
      icon = " " .. icon .. " "
      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
      item.kind = icon
    else
      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
      item.menu = ({
        nvim_lsp = "[LSP/" .. lspserver_name .. "]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[_.source.name]
    end

    return item
  end,
}

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local options = {
  -- Disabled autocompletion when writing comments, strings and in Telescope Prompt (input)!
  enabled = function()
    -- Telescope Prompt
    buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "prompt" then
      return false
    end

    -- Comments and strings

    -- Function for checking if substring exists in the main string (returns true or false)
    function hasSubstring(mainString, subString)
      return string.find(mainString, subString) ~= nil
    end

    -- Get current line string
    local currentLineText = vim.api.nvim_get_current_line()

    -- Check if in the current line there is a word import or className
    local importFound = hasSubstring(currentLineText, "import")
    local classNameFound = hasSubstring(currentLineText, "className")

    local context = require "cmp.config.context"

    -- Check if current line is a comment and if it is then disable autocompletion
    if context.in_treesitter_capture "comment" or context.in_syntax_group "Comment" then
      return false
    -- Check if it's an import statement and if it is enable autocompletion
    elseif (context.in_treesitter_capture "string" or context.in_syntax_group "String") and importFound then
      return true
    -- Check if it's a className property and if it is enable autocompletion (for tailwindcss)
    elseif (context.in_treesitter_capture "string" or context.in_syntax_group "String") and classNameFound then
      return true
    else
      return true
    end
  end,

  completion = {
    completeopt = "menu,menuone,noselect",
  },
  window = {
    completion = {
      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
      scrollbar = false,
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,

  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "nvim_lsp", trigger_characters = { "-" } },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
    { name = "nvim_lua" },
    { name = "path" },
    { name ="cmdline" }
  },
}

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
  options.window.completion.border = border "CmpBorder"
end

return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      },
      { "hrsh7th/cmp-cmdline" },
    },
    opts = options,
  },
}
