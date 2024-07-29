local map = vim.keymap.set

-- Universal mappings for both neovim and vscode instance
-- map("n", ";", ":", { desc = "Enter CMD mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("v", "y", "ygv<Esc>", { desc = "Yank preventing cursor from jumping back to where selection started" })

-- Go to beggining and end of line
map("i", "<C-b>", "<ESC>^i", { desc = "Move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move end of line" })

-- Navigate in insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("v", "<", "<gv", { desc = "Indent" })
map("v", ">", ">gv", { desc = "Indent" })

if vim.g.vscode then
  -- VSCode mappings
  vim.g.mapleader = ' '
  require('hackKeymap')

  -- Open file in explorer
  vim.api.nvim_set_keymap('n', '<leader>of', ':call VSCodeNotify("remote-wsl.revealInExplorer")<CR> | :call VSCodeNotify("revealFileInOS")<CR>', { noremap = true, silent = true, desc = "Open file location in file explorer" })

  vim.api.nvim_set_keymap('n', '<leader>ff', ':call VSCodeNotify("workbench.action.quickOpen") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>x', ':call VSCodeNotify("workbench.action.closeActiveEditor") <CR>', { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>ca', ':call VSCodeNotify("editor.action.codeAction") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fa', ':call VSCodeNotify("editor.action.rename") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fw', ':call VSCodeNotify("workbench.action.findInFiles") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>te', ':call VSCodeNotify("workbench.actions.view.problems") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>tt', ':call VSCodeNotify("workbench.action.terminal.toggleTerminal") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>tp', ':call VSCodeNotify("workbench.action.togglePanel") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'gr', ':call VSCodeNotify("editor.action.goToReferences") <CR>', { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>zm', ':call VSCodeNotify("workbench.action.toggleZenMode") <CR>', { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', 'zM', ':call VSCodeNotify("editor.foldAll") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zR', ':call VSCodeNotify("editor.unfoldAll") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zc', ':call VSCodeNotify("editor.fold") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zC', ':call VSCodeNotify("editor.foldRecursively") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zo', ':call VSCodeNotify("editor.unfold") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zO', ':call VSCodeNotify("editor.unfoldRecursively") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'za', ':call VSCodeNotify("editor.toggleFold") <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zy', ':call VSCodeNotify("editor.foldAllExcept") <CR>', { noremap = true, silent = true })

else
  -- Neovim mappings
  map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
  map({"n", "i", "v"}, "<C-s>", "<ESC><cmd>w<CR>", { desc = "Save file" })
  map("n", "<C-z>", "<NOP>", { desc = "Unmap force closing with <C-z>" })
  map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })
  map("n", "<leader>of", function()
    vim.ui.open(vim.fn.expand "%:p:h")
  end, { desc = "Open file location in file explorer" })

  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
  map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
  map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

  -- Move currently selected line up or down
  map("n", "<A-j>", "<cmd>:m+<CR>", { desc = "Move line down" })
  map("n", "<A-k>", "<cmd>:m-2<CR>", { desc = "Move line up" })
  map("i", "<A-j>", "<ESC><cmd>:m.+1<CR>", { desc = "Move line down" })
  map("i", "<A-k>", "<ESC><cmd>:m.-2<CR>", { desc = "Move line up" })
  map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
  map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

  -- Switch between windows
  map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
  map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
  map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
  map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

  -- Line numbers and cheatsheet
  map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
  map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
  map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

  -- Center the view when scrolling
  map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
  map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })

  -- map("n", "<leader>tt", function()
  --   require("base46").toggle_transparency()
  -- end)
  -- map("n", "<C-z>", "<cmd>LiveServerStart<CR>", { desc = "Start live server" })

  -- Tabufline
  map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
  map("n", "<tab>", function() require("nvchad.tabufline").next() end, { desc = "buffer goto next" })
  map("n", "<S-tab>", function() require("nvchad.tabufline").prev() end, { desc = "buffer goto prev" })
  map("n", "<leader>x", function() require("nvchad.tabufline").close_buffer() end, { desc = "buffer close" })
  map("n", "<leader>,", function() require("nvchad.tabufline").move_buf(-1) end, { desc = "move buffer left" })
  map("n", "<leader>.", function() require("nvchad.tabufline").move_buf(1) end, { desc = "move buffer right" })
  map("n", "<leader>1", function() vim.api.nvim_set_current_buf(vim.t.bufs[1]) end, { desc = "Go to Buffer 1"})
  map("n", "<leader>2", function() vim.api.nvim_set_current_buf(vim.t.bufs[2]) end, { desc = "Go to Buffer 2"})
  map("n", "<leader>3", function() vim.api.nvim_set_current_buf(vim.t.bufs[3]) end, { desc = "Go to Buffer 3"})
  map("n", "<leader>4", function() vim.api.nvim_set_current_buf(vim.t.bufs[4]) end, { desc = "Go to Buffer 4"})
  map("n", "<leader>5", function() vim.api.nvim_set_current_buf(vim.t.bufs[5]) end, { desc = "Go to Buffer 5"})
  map("n", "<leader>b6", function() vim.api.nvim_set_current_buf(vim.t.bufs[6]) end, { desc = "Go to Buffer 6"})
  map("n", "<leader>b7", function() vim.api.nvim_set_current_buf(vim.t.bufs[7]) end, { desc = "Go to Buffer 7"})
  map("n", "<leader>b8", function() vim.api.nvim_set_current_buf(vim.t.bufs[8]) end, { desc = "Go to Buffer 8"})
  map("n", "<leader>b9", function() vim.api.nvim_set_current_buf(vim.t.bufs[9]) end, { desc = "Go to Buffer 9"})

  -- terminal
  map("t", "<C-q>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

  -- new terminals
  map("n", "<leader>h", function()
    require("nvchad.term").new { pos = "sp" }
  end, { desc = "terminal new horizontal term" })

  map("n", "<leader>v", function()
    require("nvchad.term").new { pos = "vsp" }
  end, { desc = "terminal new vertical window" })

  -- toggleable
  map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
  end, { desc = "terminal toggleable vertical term" })

  map({ "n", "t" }, "<A-h>", function()
    require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
  end, { desc = "terminal new horizontal term" })

  map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
  end, { desc = "terminal toggle floating term" })

  -- blankline
  map("n", "<leader>cc", function()
    local config = { scope = {} }
    config.scope.exclude = { language = {}, node_type = {} }
    config.scope.include = { node_type = {} }
    local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

    if node then
      local start_row, _, end_row, _ = node:range()
      if start_row ~= end_row then
        vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
        vim.api.nvim_feedkeys("_", "n", true)
      end
    end
  end, { desc = "blankline jump to current context" })


end
