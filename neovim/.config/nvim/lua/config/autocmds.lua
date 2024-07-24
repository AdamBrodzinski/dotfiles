-- Autocmds are automatically loaded on the VeryLazy event

-- load keymaps for toggleterm only
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua Set_toggle_term_keymaps()")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd("verbose set conceallevel=0")
  end,
})
