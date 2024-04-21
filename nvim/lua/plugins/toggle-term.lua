local map_toggle = function(keymap, count, desc)
  return {
    keymap,
    function()
      vim.cmd.ToggleTerm({ count = count })
    end,
    desc,
  }
end

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc><esc>", vim.cmd.ToggleTerm, opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<leader>r", vim.cmd.ToggleTerm, desc = "Terminal" },
    map_toggle("<C-1>", 1, "Toggle 1st Terminal"),
    map_toggle("<C-2>", 2, "Toggle 2nd Terminal"),
    map_toggle("<C-3>", 3, "Toggle 3rd Terminal"),
    map_toggle("<C-4>", 4, "Toggle 4th Terminal"),
  },
  opts = {
    direction = "float",
    shade = true,
    auto_scroll = true,
    start_in_insert = true,
  },
}
