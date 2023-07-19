vim.keymap.set('n', '<leader>r', vim.cmd.ToggleTerm)
vim.keymap.set('t', '<esc>', vim.cmd.ToggleTerm)

return {
	'akinsho/toggleterm.nvim',
	event = "VeryLazy",
	config = function() 
		require('toggleterm').setup({direction = 'float'})
	end
}
