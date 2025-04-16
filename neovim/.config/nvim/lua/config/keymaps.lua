-- minus the default keymaps disabled in ./disable-keymaps.lua
require("config/disable-keymaps")

-- disable recording
vim.keymap.set("n", "Q", "<nop>")

-- open quickfix list
vim.keymap.set("n", "q", "<cmd>copen<cr>")

-- Remap :w to Cmd+s using Kitty keycode
vim.api.nvim_set_keymap("n", "<Esc>cmds", ":w<CR>", { noremap = true, silent = true })

-- Copy the buffer filepath to the clipboard
vim.api.nvim_set_keymap("n", "<leader>fp", '<Cmd>let @+=expand("%:p")<CR>', { desc = "Copy File Path to clipboard" })
