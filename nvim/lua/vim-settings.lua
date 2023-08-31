vim.opt.updatetime = 750

-- use undotree history instead
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- yank to clipboard
vim.cmd([[ set clipboard=unnamedplus ]])

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- default lang tabs, lang overrides in ftplugin
vim.o.tabstop = 3    -- size of a hard tabstop
vim.o.shiftwidth = 3 -- size of the indentation

-- lsp diagnostics
vim.api.nvim_set_keymap('n', '<leader>eh', function() vim.diagnostic.goto_prev() end,
	{ noremap = true, desc = "hover current error" })
