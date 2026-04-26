-- formatting
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		rust = { "rustfmt" },
		javascript = { "oxfmt", "prettier", stop_after_first = true },
	},
})

vim.keymap.set("", "<leader>cf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)
