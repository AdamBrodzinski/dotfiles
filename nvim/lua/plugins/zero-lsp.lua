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
			local lspconfig = require('lspconfig')

			lsp.ensure_installed({
				'lua-language-server',
				'pyright',
				'tsserver',
				'eslint',
				'prettierd',
				'eslint_d',
				'cssls',
			})

			lsp.on_attach(function(_client, bufnr)
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


			lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
			lspconfig.pyrite.setup({})

			lsp.setup()

			------------- null_ls setup -----------

			local null_ls = require('null-ls')

			local root_has_file = function(files)
				return function(utils)
					return utils.root_has_file(files)
				end
			end

			local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
			local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json", ".prettierignore" }

			local opts = {
				eslint_formatting = {
					condition = function(utils)
						local has_eslint = root_has_file(eslint_root_files)(utils)
						local has_prettier = root_has_file(prettier_root_files)(utils)
						return has_eslint and not has_prettier
					end,
				},
				eslint_diagnostics = {
					condition = root_has_file(eslint_root_files),
				},
				prettier_formatting = {
					condition = root_has_file(prettier_root_files),
				},
			}

			-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
					null_ls.builtins.formatting.eslint_d.with(opts.eslint_formatting),
					null_ls.builtins.formatting.prettierd.with(opts.prettier_formatting),
					null_ls.builtins.code_actions.eslint_d.with(opts.eslint_diagnostics),
				},
			})

			-- format on save
			vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
		end,
	},
}
