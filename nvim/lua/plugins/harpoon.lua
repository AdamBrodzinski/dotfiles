return {
	'theprimeagen/harpoon',
	event = 'VeryLazy',
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set('n', '<leader>hm', mark.add_file, { desc = "mark file" })
		vim.keymap.set('n', '<leader>hf', ui.toggle_quick_menu, { desc = "files marked" })
		vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, { desc = "1st harpoon mark" })
		vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, { desc = "2nd harpoon mark" })
		vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, { desc = "3rd harpoon mark" })
		vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, { desc = "4th harpoon mark" })
	end
}
