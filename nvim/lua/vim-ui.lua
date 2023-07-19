local themes = {
	'hybrid',
	'catppuccin-mocha',
	'catppuccin-latte',
	'catppuccin-frappe',
	'catppuccin-macchiato',
	'catppuccin-mocha',
}
vim.cmd('colorscheme ' .. themes[1])

vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- hybrid relative + absolute line numbers
vim.opt.number = true
vim.opt.rnu = true

vim.opt.scrolloff = 8
