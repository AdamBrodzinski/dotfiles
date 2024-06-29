-- Enable break indent
vim.opt.breakindent = true

-- Show the filepath as the terminal title
vim.opt.title = true
local cwd = string.gsub(vim.fn.getcwd(), vim.env.HOME, "~")
vim.opt.titlestring = string.gsub(cwd, "~/code/", "")
