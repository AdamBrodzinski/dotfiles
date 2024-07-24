-- LazyVim default keymaps:
-- https://www.lazyvim.org/configuration/general#keymaps

-- minus the default keymaps disabled in ./disable-keymaps.lua
require("config/disable-keymaps")

-- Disable recording
vim.keymap.set("n", "Q", "<nop>")

-- open quickfix list
vim.keymap.set("n", "q", "<cmd>copen<cr>")

-- Remap :w to Cmd+s using Kitty keycode
vim.api.nvim_set_keymap("n", "<Esc>cmds", ":w<CR>", { noremap = true, silent = true })

-- Use Ctrl hjkl to move across splits note: (karabiner/qmk remaps <C-j> to <Down>)
-- vim.api.nvim_set_keymap("n", "<Down>", "<C-W>j", { desc = "Move focus to lower pane" })
-- vim.api.nvim_set_keymap("n", "<Up>", "<C-W>k", { desc = "Move focus to upper pane" })
-- vim.api.nvim_set_keymap("n", "<Left>", "<C-W>h", { desc = "Move focus to left pane" })
-- vim.api.nvim_set_keymap("n", "<Right>", "<C-W>l", { desc = "Move focus to right pane" })

-- Copy the buffer filepath to the clipboard
vim.api.nvim_set_keymap("n", "<leader>fp", '<Cmd>let @+=expand("%:p")<CR>', { desc = "Copy File Path to clipboard" })
