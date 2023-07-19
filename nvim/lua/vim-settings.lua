vim.opt.updatetime = 750

-- use undotree history instead
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- default lang tabs, lang overrides in ftplugin
vim.o.tabstop = 3    -- size of a hard tabstop
vim.o.shiftwidth = 3 -- size of the indentation

-- toggle line number when in insert mode
vim.cmd([[
  augroup NumberToggle
    autocmd!
    autocmd InsertEnter * set number
  augroup END
]])

vim.cmd([[
  augroup NumberToggle
    autocmd!
    autocmd InsertLeave * set relativenumber
  augroup END
]])
