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
	keys = {
		{ "<leader>tl", "<cmd>Neotest run last<cr>",                   desc = "Run last test" },
		{ "<leader>tf", "<cmd>Neotest run file<cr>",                   desc = "Run tests in file" },
		{ "<leader>tt", function() require("neotest").run.run() end,   desc = "Run nearest test" },
		{ "<leader>te", '<cmd>TroubleToggle document_diagnostics<cr>', desc = "show test errors (file)" },
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
