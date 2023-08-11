local themes = {
	'nordic',
	'kanagawa-dragon',
	'kanagawa-lotus',
	'kanagawa',
	'hybrid',
}

vim.opt.termguicolors = true

vim.cmd('colorscheme ' .. themes[1])

-- use terminal background colors
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- hybrid relative + absolute line numbers
vim.opt.number = true
vim.opt.rnu = true

vim.opt.scrolloff = 8
