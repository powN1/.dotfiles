return {
  "HiPhish/rainbow-delimiters.nvim",
  lazy = true,
  event = "BufReadPost",
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
}
