return {
  "echasnovski/mini.animate",
  version = "*",
  init = function()
    require("mini.animate").setup {
      cursor = { enable = false },
      resize = { enable = false },
      open = { enable = false },
      close = { enable = false },
      scroll = {
        -- Timing of animation (how steps will progress in time)
        timing = require("mini.animate").gen_timing.linear { duration = 100, unit = "total" }, --<function: implements linear total 250ms animation duration>,
      },
    }
  end,
}
