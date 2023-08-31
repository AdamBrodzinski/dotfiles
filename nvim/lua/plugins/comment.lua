return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
			toggler = {
				line = '<leader>c'
			},
			opleader = {
				line = '<leader>c'
			}
		})
	end
}
