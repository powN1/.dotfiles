return {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat" },
  config = function()
    local leap = require "leap"

    leap.setup {
      leap.create_default_mappings(),
    }
  end,
  -- init = function()
  --   vim.api.nvim_set_hl(0, "LeapMatch", {
  --     -- For light themes, set to 'black' or similar.
  --     fg = "#FF7361",
  --     bold = true,
  --     nocombine = true,
  --   })
  --   require("leap").opts.highlight_unlabeled_phase_one_targets = true
  -- end,
  lazy = false,
}
