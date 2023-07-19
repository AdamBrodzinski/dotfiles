-- setup lazy.vim package manager if it's not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- must set leader before lazy.vim
vim.g.mapleader = " "
-- lazy load all plugins from lua/plugins/*
require('lazy').setup('plugins')

-- vim overrides/settings
require('vim-remaps')
require('vim-ui')
require('vim-settings')
