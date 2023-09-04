return {
	'akinsho/toggleterm.nvim',
	config = function()
		require('toggleterm').setup({
			direction = 'float',
			shade = true,
			auto_scroll = true,
			start_in_insert = true,
		})

		vim.keymap.set('n', '<leader>r', vim.cmd.ToggleTerm, { desc = "toggle console" })

		-- change terminal once its open
		vim.keymap.set('n', '<C-1>', function() vim.cmd.ToggleTerm({ count = 1 }) end, { desc = "toggle 1st" })
		vim.keymap.set('n', '<C-2>', function() vim.cmd.ToggleTerm({ count = 2 }) end, { desc = "toggle 2nd" })
		vim.keymap.set('n', '<C-3>', function() vim.cmd.ToggleTerm({ count = 3 }) end, { desc = "toggle 3rd" })
		vim.keymap.set('n', '<C-4>', function() vim.cmd.ToggleTerm({ count = 4 }) end, { desc = "toggle 4th" })
		vim.keymap.set('n', '<C-5>', function() vim.cmd.ToggleTerm({ count = 5 }) end, { desc = "toggle 5th" })
		vim.keymap.set('n', '<C-6>', function() vim.cmd.ToggleTerm({ count = 5 }) end, { desc = "toggle 5th" })

		vim.keymap.set('t', '<esc>', vim.cmd.ToggleTerm)
	end
}
