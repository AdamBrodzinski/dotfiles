return {
	"folke/trouble.nvim",
	wrap = true,
	keys = {
		{ "<leader>ep", '<cmd>TroubleToggle<cr>',                      desc = "show errors for project" },
		{ "<leader>ee", '<cmd>TroubleToggle document_diagnostics<cr>', desc = "show errors in buffer" },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
