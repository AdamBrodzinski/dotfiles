vim.g.undotree_WindowLayout = 2
vim.g.undotree_SplitWidth = 40

return {
	'mbbill/undotree',
	keys = {
		{ '<leader>u', vim.cmd.UndotreeToggle, desc = 'undo tree' },
	},
}
