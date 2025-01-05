return {
  'barrett-ruth/live-server.nvim',
  build = 'npm install live-server',
  cmd = { 'LiveServerStart', 'LiveServerStop' },
  lazy = false,
  config = function()
    local port = 5555

    require("live-server").setup({
      args = { '--port=' .. port }
    })

    -- Notify on which port its running since the plugin doesn't ...
    vim.api.nvim_create_user_command("LiveServerStart", function()
      print('Server running on: 127.0.0.1:' .. port)
    end, {})
    vim.api.nvim_create_user_command("LiveServerStop", function()
      print('Server stopped running on: 127.0.0.1:' .. port)
    end, {})
  end,
}
