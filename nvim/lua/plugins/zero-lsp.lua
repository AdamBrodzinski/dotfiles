return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.api.nvim_command, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' },
			{ '/jose-elias-alvarez/null-ls.nvim' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
			-- lang plugins
			{ 'jose-elias-alvarez/typescript.nvim' },
		},
		config = function()
			require('lsp-zero.settings').preset({})
			local lsp = require('lsp-zero')

			lsp.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				--lsp.default_keymaps({ buffer = bufnr })
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
			end)

			local cmp = require('cmp')
			local cmp_action = require('lsp-zero.cmp').action()


			cmp.setup({
				mapping = {
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-f>'] = cmp_action.luasnip_jump_forward(),
					['<C-b>'] = cmp_action.luasnip_jump_backward(),
				}
			})

			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

			lsp.setup()

			local null_ls = require('null-ls')

			null_ls.setup({
				sources = {
					-- Replace these with the tools you have installed
					-- make sure the source name is supported by null-ls
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
				}
			})


			-- format on save
			vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
		end,
	},
}
