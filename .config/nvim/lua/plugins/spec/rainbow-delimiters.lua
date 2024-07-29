-- Rainbow brackets
return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    require("rainbow-delimiters.setup").setup {
      blacklist = { "html" },
      highlight = {
        -- 'RainbowDelimiterRed',
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        -- "RainbowDelimiterOrange",
        -- "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
      query = {
        -- Only rainbow curly brackets (functions, objects) and not the html tags
        tsx = "rainbow-parens",
        javascript = "rainbow-parens",
      },
    }
  end,
  -- Has to be loaded on startup in order to work from the get-go
  lazy = false,
}
