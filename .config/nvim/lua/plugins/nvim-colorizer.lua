return {
  'norcalli/nvim-colorizer.lua',
  event = { 'BufNewFile', 'BufReadPre' },
  lazy = true,
  config = function()
    vim.opt.termguicolors = true
    require "colorizer".setup()
  end
}
