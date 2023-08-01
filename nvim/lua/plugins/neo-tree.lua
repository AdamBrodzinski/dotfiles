return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	config = function()
		require('neo-tree').setup({
			default_component_configs = {
				icon = {
					folder_closed = "-",
					folder_open = "-",
					folder_empty = "-",
					default = "*",
					highlight = "NeoTreeFileIcon"
				},
			},
			filesystem = {
				filtered_items = {
					hide_by_name = {
						"node_modules",
					}
				},
				follow_current_file = { enabled = true }
			},
			window = {
				width = 40
			}
		})
	end
}
