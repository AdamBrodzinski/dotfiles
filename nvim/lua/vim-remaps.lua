vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.api.nvim_set_keymap('n', '<Esc>cmds', ':w<CR>', { noremap = true })

-- use Ctrl+hjkl to move across panes
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })

-- copy the current filepath into OS clipboard
vim.api.nvim_set_keymap('n', '<leader>qf', '<Cmd>let @+=expand("%:p")<CR>', { noremap = true, silent = true })
