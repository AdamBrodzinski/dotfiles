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
					show_hidden_count = false,
					hide_by_pattern = {
						"*.opam",
					},
					hide_by_name = {
						"README.md",
						"Readme.md",
						"_build",
						"buld",
						"app.html",
						"build",
						"dune",
						"dune-project",
						"gleam.toml",
						"manifest.toml",
						"Makefile",
						"node_modules",
						"package.json",
						"static",
						"svelte.config.js",
						"vite.config.js",
						"yarn.lock",
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
