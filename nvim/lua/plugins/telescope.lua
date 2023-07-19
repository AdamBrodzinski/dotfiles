-- find from git root or fallback to find_files
function vim.find_files_from_project_git_root()
	local function is_git_repo()
		vim.fn.system("git rev-parse --is-inside-work-tree")
		return vim.v.shell_error == 0
	end
	local function get_git_root()
		local dot_git_path = vim.fn.finddir(".git", ".;")
		return vim.fn.fnamemodify(dot_git_path, ":h")
	end
	local opts = {}
	if is_git_repo() then
		opts = {
			cwd = get_git_root(),
		}
	end
	require("telescope.builtin").find_files(opts)
end

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close
					},
				},
			}
		})

		vim.keymap.set('n', '<leader><leader>', vim.find_files_from_project_git_root, { desc = "files" })
		--vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = "files" })
		vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = "by commit message" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "help docs" })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'grep popup' })
		vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({ search = vim.fn.input("Grep >") }) end,
			{ desc = 'search' })
		vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'reference' })
		vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = 'definition' })
		vim.keymap.set('n', '<leader>fi', builtin.lsp_type_definitions, { desc = 'implementation?' })
	end
}
