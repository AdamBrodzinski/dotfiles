return {
	'nvim-neotest/neotest',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'antoinemadec/FixCursorHold.nvim',
		-- adapters
		'jfpedroza/neotest-elixir',
		'haydenmeade/neotest-jest',
		'adrigzr/neotest-mocha',
		'marilari88/neotest-vitest',
	},
	config = function()
		require('neotest').setup({
			adapters = {
				require('neotest-elixir'),
				require('neotest-jest'),
				require('neotest-mocha'),
				require('neotest-vitest'),
			},
		})
	end
}
