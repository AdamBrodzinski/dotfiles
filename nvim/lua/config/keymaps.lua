-- Disable recording
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

-- Remap :w to Cmd+s using Kitty keycode
vim.api.nvim_set_keymap("n", "<Esc>cmds", ":w<CR>", { noremap = true, silent = true })

-- Use Ctrl hjkl to move across splits note: (karabiner/qmk remaps <C-j> to <Down>)
vim.api.nvim_set_keymap("n", "<Down>", "<C-W>j", { desc = "Move focus to lower pane" })
vim.api.nvim_set_keymap("n", "<Up>", "<C-W>k", { desc = "Move focus to upper pane" })
vim.api.nvim_set_keymap("n", "<Left>", "<C-W>h", { desc = "Move focus to left pane" })
vim.api.nvim_set_keymap("n", "<Right>", "<C-W>l", { desc = "Move focus to right pane" })

-- Double tap to exit the terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
