vim.pack.add({
	{ src = "https://github.com/webhooked/kanso.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/kamwitsta/vinyl.nvim" },
	{ src = "https://github.com/maxmx03/solarized.nvim" },
	{ src = "https://github.com/zenbones-theme/zenbones.nvim" },
})

vim.cmd("colorscheme kanso")

require("auto-dark-mode").setup({
	set_dark_mode = function()
		vim.o.background = "dark"
	end,
	set_light_mode = function()
		vim.o.background = "light"
	end,
})

-- -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-hues.md
-- require("mini.hues").setup({
-- 	background = "#17280e",
-- 	foreground = "#c4c8c2",
-- })
