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
vim.o.tabstop = 2    -- size of a hard tabstop
vim.o.shiftwidth = 2 -- size of the indentation

vim.cmd [[ autocmd FileType ocaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]]
