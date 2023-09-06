return {
	{
		'sbdchd/vim-hybrid',
		lazy = false,
		priority = 1000,
	},
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('nordic').setup({
				--transparent_bg = true,
				transparent_bg = true,
				swap_backgrounds = false,
			})
		end
	},
	{ 'catppuccin/nvim' },
	{ 'baliestri/aura-theme' },
	{ 'rebelot/kanagawa.nvim' },
}
