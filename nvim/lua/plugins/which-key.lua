return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local opts = { prefix = '<leader>' }

		local keys = {
			c = { name = 'console' },
			f = { name = 'find' },
			h = { name = 'harpoon' },
			l = { name = 'language' },
		}

		vim.o.timeout = true
		vim.o.timeoutlen = 1000

		require('which-key').register(keys, opts)
	end
}
