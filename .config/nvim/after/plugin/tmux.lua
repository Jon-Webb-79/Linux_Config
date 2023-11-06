-- Navigation between tmux panes and vim splits using vim-tmux-navigator
vim.keymap.set('n', '<C-h>', "<cmd>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set('n', '<C-j>', "<cmd>TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set('n', '<C-k>', "<cmd>TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set('n', '<C-l>', "<cmd>TmuxNavigateRight<cr>", { silent = true })

-- Optional: Navigation to the last pane
vim.keymap.set('n', '<C-\\>', "<cmd>TmuxNavigatePrevious<cr>", { silent = true })

