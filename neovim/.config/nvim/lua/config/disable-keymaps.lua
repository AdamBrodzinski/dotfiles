-- disable default keymaps in LazyVim
-- https://www.lazyvim.org/configuration/keymaps

vim.keymap.del("v", "<") -- indent out
vim.keymap.del("v", ">") -- indent in

-- Resize window using <ctrl> arrow keys
vim.keymap.del("n", "<C-Up>", { desc = "Increase Window Height" })
vim.keymap.del("n", "<C-Down>", { desc = "Decrease Window Height" })
vim.keymap.del("n", "<C-Left>", { desc = "Decrease Window Width" })
vim.keymap.del("n", "<C-Right>", { desc = "Increase Window Width" })

-- tabs
vim.keymap.del("n", "<leader><tab>l", { desc = "Last Tab" })
vim.keymap.del("n", "<leader><tab>f", { desc = "New Tab" })
vim.keymap.del("n", "<leader><tab><tab>", { desc = "New Tab" })
vim.keymap.del("n", "<leader><tab>]", { desc = "Next Tab" })
vim.keymap.del("n", "<leader><tab>d", { desc = "Close Tab" })
vim.keymap.del("n", "<leader><tab>[", { desc = "Previous Tab" })

-- buffers
vim.keymap.del("n", "]b")
vim.keymap.del("n", "<leader>bb")

-- save file
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>", { desc = "Save File" })

--keywordprg
vim.keymap.del("n", "<leader>K", { desc = "Keywordprg" })

vim.keymap.del("n", "<leader>l") -- open Lazy

vim.keymap.del("n", "<leader>fn") -- new file
vim.keymap.del("n", "<leader>qq") -- quit

-- Terminal Mappings
vim.keymap.del("t", "<C-h>", { desc = "Go to Left Window" })
vim.keymap.del("t", "<C-j>", { desc = "Go to Lower Window" })
vim.keymap.del("t", "<C-k>", { desc = "Go to Upper Window" })
vim.keymap.del("t", "<C-l>", { desc = "Go to Right Window" })
vim.keymap.del("t", "<C-/>", { desc = "Hide Terminal" })
vim.keymap.del("t", "<esc><esc>", { desc = "Enter Normal Mode" })
