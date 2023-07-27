return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
			toggler = {
				line = '<leader>lc'
			},
			opleader = {
				line = '<leader>lc'
			}
		})
	end
}
