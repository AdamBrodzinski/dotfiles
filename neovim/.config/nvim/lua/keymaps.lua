-- Copy current filepath to clipboard
vim.keymap.set(
	"n",
	"<leader>fP",
	'<Cmd>let @+=expand("%:p")<CR>',
	{ desc = "Copy Full File Path to clipboard" }
)
vim.keymap.set("n", "<leader>fp", function()
	local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
	vim.fn.setreg("+", path)
	print("Copied to clipboard: " .. path)
end, { desc = "Copy relative path to clipboard" })

-- Go to next/prev diagnostic message
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next Error " })
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Prev Error " })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
