return {
  -- Use my forked repo which added URL notification when running LiveServerStart
  'pown1/live-server.nvim',
  build = 'npm install live-server',
  cmd = { 'LiveServerStart', 'LiveServerStop' },
  lazy = false,
  config = function()
    -- local port = 5555
    require("live-server").setup({
      -- args = { '--port=' .. port }
    })
  end,
}
