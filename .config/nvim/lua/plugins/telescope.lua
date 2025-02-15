return {
  "nvim-telescope/telescope.nvim",
  -- cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" }
  },
  init = function()
    require("telescope").setup {
      defaults = {
        file_ignore_patterns = { "node_modules" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },

        mappings = {
          n = {
            ["q"] = require("telescope.actions").close,
            ["dd"] = require("telescope.actions").delete_buffer,
          },
        },
      },

      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },

      extensions = {
        fzf = {}
      },
    }

    require("telescope").load_extension("fzf")

    local map = vim.keymap.set
    map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
    map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })
    map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
    map("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastued=true initial_mode=normal theme=ivy<CR>", { desc = "telescope find buffers" })
    map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
    map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
    map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
    map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope LSP diagnostics" })
    map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
    map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
    map("n", "<leader>th", "<cmd>Telescope colorscheme<CR>", { desc = "telescope theme picker" })
    map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
    map("n", "<leader>hi", "<cmd>Telescope highlights<CR>", { desc = "telescope highlights" })
  end,
}
