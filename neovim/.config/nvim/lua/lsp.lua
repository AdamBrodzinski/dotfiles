require("mason").setup({})

require("mason-tool-installer").setup({
	auto_update = true,
	ensure_installed = {
		"bash-language-server",
		"lua-language-server",
		"stylua",
		"oxlint",
		"oxfmt",
		"typescript-language-server",
		"rust-analyzer",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.enable("bash-languages-server")
vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ts_ls")
vim.lsp.enable("oxfmt")
vim.lsp.enable("oxlint")
vim.lsp.enable("rust_analyzer")

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
	desc = "Show LSP health info",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "LSP Hover")
		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "<leader>r", vim.lsp.buf.rename, "Rename symbol")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, "Format buffer")
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = "if_many",
	},
	underline = true,
	virtual_text = {
		spacing = 2,
		source = "if_many",
		prefix = "●",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.HINT] = "H",
		},
	},
})

local map_multistep = require("mini.keymap").map_multistep
-- map_multistep("i", "<Tab>", { "pmenu_next" }) -- next item
-- map_multistep("i", "<S-Tab>", { "pmenu_prev" }) -- prev item
-- map_multistep("i", "<CR>", { "pmenu_accept" }) -- accept selected (falls through to normal <CR> otherwise)

-- <Tab>: try snippets first, then completion menu, then jumps, then indent
map_multistep("i", "<Tab>", {
	"minisnippets_next",
	"minisnippets_expand",
	"pmenu_next",
})

-- <S-Tab>: mirror of <Tab>
map_multistep("i", "<S-Tab>", {
	"minisnippets_prev",
	"pmenu_prev",
})

-- <CR>: accept completion if selected, else respect pairs
map_multistep("i", "<CR>", {
	"pmenu_accept",
	-- "minipairs_cr",
	-- 'nvimautopairs_cr',  -- only if you use nvim-autopairs instead of mini.pairs
})

-- <BS>: hungry delete whitespace, else respect pairs
-- map_multistep("i", "<BS>", {
-- 	-- "minipairs_bs",
-- })
