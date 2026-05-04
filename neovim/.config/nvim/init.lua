vim.pack.add({
	-- syntax highlighting
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	-- various vim mini plugins in one plugin package
	{ src = "https://github.com/github.com/nvim-mini/mini.nvim", version = "4f6f84a" },
	-- file explorer
	{ src = "https://github.com/github.com/stevearc/oil.nvim", version = "v2.15.0" },
	-- git diffs in gutter
	{ src = "https://github.com/lewis6991/gitsigns.nvim", version = "v2.1.0" },
	-- file location jump
	{ src = "https://github.com/folke/flash.nvim", version = "v2.1.0" },
	-- bind vim keys to zellij navigation
	{ src = "https://git.sr.ht/~swaits/zellij-nav.nvim" },
	-- enable auto formatting on file save (install formatters with Mason)
	{ src = "https://github.com/stevearc/conform.nvim", version = "v9.1.0" },
	-- provide default inputs for most LSPs, provides override
	{ src = "https://github.com/github.com/neovim/nvim-lspconfig", version = "8fde495" },
	-- install language server or formatter
	{ src = "https://github.com/mason-org/mason.nvim", version = "v2.2.1" },
	-- ensure that a list of LSPs are always installed, auto updater
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", version = "443f1ef" },
	-- file mark manager (Harpoon replacement)
	{ src = "https://github.com/vieitesss/miniharp.nvim", version = "v0.4.0" },
	-- auto switch background light/dark based on system dark mode
	{ src = "https://github.com/f-person/auto-dark-mode.nvim", version = "54058b4" },
	-- { src = "", version = "" },
})

require("sane-defaults")
require("theme")
require("keymaps")
require("lsp")
require("formatting")
require("snippets")

-- config plugins

require("mini.icons").setup({})
require("mini.pairs").setup({})
require("mini.statusline").setup({})
require("mini.completion").setup({})

require("mini.hipatterns").setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
	},
})

require("mini.pick").setup({})
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick buffers<cr>", { desc = "[F]uzzy Find [F]iles" })
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "[F]uzzy Find [F]iles" })
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<cr>", { desc = "[F]uzzy Find by [G]rep" })
vim.keymap.set("n", "<leader>fr", "<cmd>Pick resume<cr>", { desc = "[F]uzzy Find [R]esume" })

-- vim.keymap.set("n", "<leader>fE", builtin.diagnostics, { desc = "[F]uzzy Find [E]rrors" })
-- vim.keymap.set("n", "<leader>fR", builtin.lsp_references, { desc = "[F]uzzy Find [R]eferences" })
-- vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "[F]uzzy Find [I]mplementations" })
-- vim.keymap.set("n", "<leader>fD", builtin.lsp_definitions, { desc = "[F]uzzy Find [I]mplementations" })

require("flash").setup({})
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash search" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", { desc = "Git Blame" })

require("zellij-nav").setup({})
vim.keymap.set("n", "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "navigate left or tab" })
vim.keymap.set("n", "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" })
vim.keymap.set("n", "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" })
vim.keymap.set("n", "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" })

require("oil").setup({
	view_options = {
		show_hidden = false,
		cleanup_delay_ms = 200,
		is_hidden_file = function(name, bufnr)
			if vim.startswith(name, "..") then
				return false
			end

			local patterns = {
				"^.cargo$",
				"^.claude$",
				"^.env",
				"^.git$",
				"^.gitignore$",
				"^.planning$",
				"^AGENTS.md$",
				"^CLAUDE.md$",
				"^Cargo.*$",
				"^Dockerfile$",
				"^.dockerignore$",
				"^docker%-compose%.yml$",
				"^justfile$",
				"^node_modules$",
				"^package.lock.json$",
				"^target$",
			}

			for _, pat in ipairs(patterns) do
				if name:match(pat) then
					return true
				end
			end

			return false
		end,
	},
})
vim.keymap.set("n", "<leader>fz", "<cmd>Oil .<cr>", { desc = "Files (tree from root)" })
vim.keymap.set("n", "<leader>fe", "<Cmd>Oil<CR>", { desc = "Files (current)" })
vim.keymap.set("n", "<leader>ft", "<Cmd>Oil .<CR>", { desc = "Files (tree from root)" })

local miniharp = require("miniharp")

vim.keymap.set("n", "<leader>hm", miniharp.add_file, { desc = "Harp save Mark" })
vim.keymap.set("n", "<leader>hM", miniharp.toggle_file, { desc = "Harp toggle Mark" })
vim.keymap.set("n", "<C-n>", miniharp.next, { desc = "Harp Next mark" })
vim.keymap.set("n", "<C-p>", miniharp.prev, { desc = "Harp Prev mark" })
vim.keymap.set("n", "<leader>hh", miniharp.show_list, { desc = "Harp show list" })
vim.keymap.set("n", "<leader>hc", miniharp.clear, { desc = "Harp clear" })

vim.keymap.set("n", "<leader>1", function()
	miniharp.go_to(1)
end, { desc = "miniharp: go to mark 1" })
vim.keymap.set("n", "<leader>2", function()
	miniharp.go_to(2)
end, { desc = "miniharp: go to mark 2" })
vim.keymap.set("n", "<leader>3", function()
	miniharp.go_to(3)
end, { desc = "miniharp: go to mark 3" })
vim.keymap.set("n", "<leader>4", function()
	miniharp.go_to(4)
end, { desc = "miniharp: go to mark 4" })
