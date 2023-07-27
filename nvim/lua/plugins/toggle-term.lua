return {
	'akinsho/toggleterm.nvim',
	config = function()
		require('toggleterm').setup({
			direction = 'float',
			shade = true,
			auto_scroll = true
		})
		vim.keymap.set('n', '<leader>c', vim.cmd.ToggleTerm, { desc = "toggle console" })
		vim.keymap.set('n', '<leader>c1', function() vim.cmd.ToggleTerm({ count = 1 }) end, { desc = "toggle 1st" })
		vim.keymap.set('n', '<leader>c2', function() vim.cmd.ToggleTerm({ count = 2 }) end, { desc = "toggle 2nd" })
		vim.keymap.set('n', '<leader>c3', function() vim.cmd.ToggleTerm({ count = 3 }) end, { desc = "toggle 3rd" })
		vim.keymap.set('n', '<leader>c4', function() vim.cmd.ToggleTerm({ count = 4 }) end, { desc = "toggle 4th" })
		vim.keymap.set('t', '<esc>', vim.cmd.ToggleTerm)
	end
}
