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
				indent = {
					indent_size = 3,
				},
			},
			filesystem = {
				filtered_items = {
					show_hidden_count = false,
					hide_by_pattern = {
						"*.d.ts",
						"*.json",
						"*.lock",
						"*.md",
						"*.opam",
						"*.plantuml",
						"*.toml",
						"*.yml",
						"*config*",
					},
					hide_by_name = {
						"_build",
						"app.html",
						"build",
						"bun.lockb",
						"Dockerfile",
						"dune",
						"dune-project",
						"Makefile",
						"node_modules",
						'public',
						"static",
						"webpack",
					},
					never_show = {
						".DS_Store",
					}

				},
				follow_current_file = { enabled = true }
			},
			window = {
				width = 40
			},
			event_handlers = {
				{
					event = "vim_buffer_enter",
					handler = function()
						if vim.bo.filetype == "neo-tree" then
							vim.cmd("setlocal number")
							vim.cmd("setlocal rnu")
						end
					end,
				},
				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						-- require("neo-tree.command").execute({ action = "close" })
					end
				},
			},
		})
	end
}
