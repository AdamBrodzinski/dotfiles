return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
			toggler = {
				line = '<Esc>cmdq'
			},
			opleader = {
				line = '<Esc>cmdq'
			}
		})
	end
}
