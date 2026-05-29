-- ------------------------------------------------------------------
--               vim settings that should be default
-- ------------------------------------------------------------------

-- spacebar is the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- show a line number in the gutter
vim.opt.number = true

-- Enable mouse mode for resizing splits
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim, async for startup time
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true
vim.opt.smartindent = true

-- Hide the cmd until it's in use (shares lualine)
vim.opt.cmdheight = 0

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep the sign column (diff symbols) open all the time
vim.opt.signcolumn = "yes"

-- Decrease update time (time while cursor hovers)
vim.opt.updatetime = 250

-- Decrease the time you have to complete combo
vim.opt.timeoutlen = 900

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "»", nbsp = "␣" }

vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 2 -- size of an indent
vim.opt.tabstop = 2 -- tabs display as 2 spaces
vim.opt.softtabstop = 2 -- <Tab>/<BS> feel like 2 spaces
-- disable spaces for makefiles for gitconfigs
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "make", "gitconfig" },
	callback = function()
		vim.bo.expandtab = false
		vim.bo.shiftwidth = 0 -- 0 = use tabstop
		vim.bo.softtabstop = 0
		vim.bo.tabstop = 4
	end,
})

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Code folding configuration using treesitter
-- Uses expression folding with treesitter for intelligent code folding
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for fold expressions
vim.opt.foldcolumn = "0" -- Don't show fold column in the gutter
vim.opt.foldlevel = 99 -- Default fold level for current window
vim.opt.foldlevelstart = -1 -- Use foldlevel value when starting (-1 means use 'foldlevel')
vim.opt.foldenable = true -- Enable folding

-- disable recording
vim.keymap.set("n", "Q", "<nop>")

-- disable this so md codeblocks don't hide
-- vim.g.indentLine_fileTypeExclude = { "json", "markdown" }
-- disable annoying markdown hidden chars
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "markdown",
-- 	callback = function()
-- 		vim.cmd("verbose set conceallevel=0")
-- 	end,
-- })

-- Clear highlights on search when pressing <Esc> in normal mode,  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- setup messages so they popup in the corner
vim.opt.winborder = "rounded"

require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = {
			[""] = "msg",
			empty = "cmd",
			bufwrite = "msg",
			confirm = "cmd",
			emsg = "pager",
			echo = "msg",
			echomsg = "msg",
			echoerr = "pager",
			completion = "cmd",
			list_cmd = "pager",
			lua_error = "pager",
			lua_print = "msg",
			progress = "pager",
			rpc_error = "pager",
			quickfix = "msg",
			search_cmd = "cmd",
			search_count = "cmd",
			shell_cmd = "pager",
			shell_err = "pager",
			shell_out = "pager",
			shell_ret = "msg",
			undo = "msg",
			verbose = "pager",
			wildlist = "cmd",
			wmsg = "msg",
			typed_cmd = "cmd",
		},
		cmd = {
			height = 0.5,
		},
		dialog = {
			height = 0.5,
		},
		msg = {
			height = 0.5,
			timeout = 5000,
		},
		pager = {
			height = 1,
		},
	},
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Save and restore fold state
vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost" }, {
	desc = "Save fold state",
	group = vim.api.nvim_create_augroup("save-folds", { clear = true }),
	pattern = "*.*",
	callback = function()
		vim.cmd("silent! mkview")
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Restore fold state",
	group = vim.api.nvim_create_augroup("load-folds", { clear = true }),
	pattern = "*.*",
	callback = function()
		vim.cmd("silent! loadview")
	end,
})
