return {
	"folke/which-key.nvim", 
	event = "VeryLazy",
	config = function() 
		local opts = { prefix = '<leader>' }

		local keys = {
			f = { name = 'find' },
			h = { name = 'harpoon' },
		}

		vim.o.timeout = true
		vim.o.timeoutlen = 500

		require('which-key').register(keys, opts)
	end
}
