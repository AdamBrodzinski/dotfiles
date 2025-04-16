-- Autocmds are automatically loaded on the VeryLazy event

-- disable annoying markdown hidden chars
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd("verbose set conceallevel=0")
  end,
})
