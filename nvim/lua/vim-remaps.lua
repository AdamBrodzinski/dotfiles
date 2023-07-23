vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "Find Explorer" })

vim.keymap.set("n", "Q", "<nop>")

-- use Ctrl+hjkl to move across panes
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })
