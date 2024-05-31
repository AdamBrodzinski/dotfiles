local map_toggle = function(keymap, count, desc)
  return {
    keymap,
    function()
      vim.cmd.ToggleTerm({ count = count })
    end,
    desc,
  }
end

-- global fn for autocommand to set keymaps for toggleterm only
function Set_toggle_term_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", vim.cmd.ToggleTerm, opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<leader>r", vim.cmd.ToggleTerm, desc = "Terminal" },
    map_toggle("<C-1>", 1, "Toggle 1st Terminal"),
    map_toggle("<C-2>", 2, "Toggle 2nd Terminal"),
    map_toggle("<C-3>", 3, "Toggle 3rd Terminal"),
    map_toggle("<C-4>", 4, "Toggle 4th Terminal"),
    -- see autocommand
  },
  opts = {
    direction = "float",
    shade = true,
    auto_scroll = true,
    start_in_insert = true,
  },
}
