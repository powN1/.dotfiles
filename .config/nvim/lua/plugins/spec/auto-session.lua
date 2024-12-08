return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup {
      auto_session_enabled = true,
      -- Sessions are stored in $HOME/$USER/.local/share/nvim/sessions/
      auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = nil,
      auto_session_allowed_dirs = nil,
      auto_session_create_enabled = true,
      auto_session_enable_last_session = false,
      auto_session_use_git_branch = false,
      auto_restore_lazy_delay_enabled = true,
      log_level = "error",

      -- cwd_change_handling = {
      --   restore_upcoming_session = true, -- Disabled by default, set to true to enable
      -- },
    }
  end,
}
