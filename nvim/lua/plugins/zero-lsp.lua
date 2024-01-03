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
			-- automatically calls setup on lsps installed via mason
			{ 'williamboman/mason-lspconfig.nvim' },
			{ '/jose-elias-alvarez/null-ls.nvim' },
			-- autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
			-- lang plugins
			{ 'danielo515/nvim-treesitter-reason' },
		},
		config = function()
			require('lsp-zero.settings').preset({})
			local lsp = require('lsp-zero')
			local lspconfig = require('lspconfig')
			local null_ls = require('null-ls')

			lsp.ensure_installed({ 'lua_ls' })

			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set('n', '<leader>lf',
					'<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
				vim.keymap.set('n', '<leader>eh', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
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

			lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

			-- disable formatting with tsserver so that eslint can format instead
			lspconfig.tsserver.setup({
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentFormattingRangeProvider = false
				end,
			})

			lspconfig.prismals.setup({
				on_init = function(_, bufnr)
					vim.api.nvim_buf_set_option(bufnr, 'tabstop', 2)
					vim.api.nvim_buf_set_option(bufnr, 'shiftwidth', 2)
				end,
			})


			lsp.setup()

			-- format on save
			vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

			-- eslint doesn't expose lsp.buf.format so we call eslint with js files
			vim.api.nvim_create_autocmd('BufWritePre', {
				pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
				command = 'silent! EslintFixAll',
				group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
			})
		end,
	},
}
