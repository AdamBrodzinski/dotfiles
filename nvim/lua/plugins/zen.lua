return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>z", '<cmd>ZenMode<cr>', desc = "Zen mode" },
	},
	config = function()
		require('zen-mode').setup({
			window = {
				width = 110
			}
		})
	end
}
