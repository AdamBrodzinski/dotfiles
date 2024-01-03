return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	config = function()
		require('gitsigns').setup({
			signs = {
				add          = { text = '+' },
				change       = { text = '│' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
		})
		local gs = package.loaded.gitsigns

		vim.keymap.set('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "git blame" })
	end
}
