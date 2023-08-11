return {
	"folke/trouble.nvim",
	wrap = true,
	keys = {
		{ "<leader>lta", '<cmd>TroubleToggle<cr>',                      desc = "show errors for project" },
		{ "<leader>ltd", '<cmd>TroubleToggle document_diagnostics<cr>', desc = "show errors for document" },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
