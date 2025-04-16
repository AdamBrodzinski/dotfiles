return {
  "stevearc/oil.nvim",
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    --    default_file_explorer = true,
    view_options = {
      show_hidden = true,
      cleanup_delay_ms = 200,
      is_hidden_file = function(name, bufnr)
        return name ~= ".." and vim.startswith(name, ".")
      end,
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = function()
    return {
      { "<leader>fe", "<Cmd>Oil<CR>", desc = "Files (current)" },
      { "<leader>ft", "<Cmd>Oil .<CR>", desc = "Files (tree from root)" },
      { "<leader>fz", "<Cmd>Oil .<CR>", desc = "Files (tree from root)" },
    }
  end,
}
