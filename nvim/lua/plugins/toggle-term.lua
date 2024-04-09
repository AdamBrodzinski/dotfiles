return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>r", vim.cmd.ToggleTerm, desc = "Te[r]minal" },
  },
  config = function()
    require("toggleterm").setup({
      direction = "float",
      shade = true,
      auto_scroll = true,
      start_in_insert = true,
    })

    -- change terminal once its open
    vim.keymap.set("n", "<C-1>", function()
      vim.cmd.ToggleTerm({ count = 1 })
    end, { desc = "Toggle 1st Terminal" })
    vim.keymap.set("n", "<C-2>", function()
      vim.cmd.ToggleTerm({ count = 2 })
    end, { desc = "Toggle 2nd Terminal" })
    vim.keymap.set("n", "<C-3>", function()
      vim.cmd.ToggleTerm({ count = 3 })
    end, { desc = "Toggle 3rd Terminal" })
    vim.keymap.set("n", "<C-4>", function()
      vim.cmd.ToggleTerm({ count = 4 })
    end, { desc = "Toggle 4th Terminal" })
    vim.keymap.set("n", "<C-5>", function()
      vim.cmd.ToggleTerm({ count = 5 })
    end, { desc = "Toggle 5th Terminal" })
    vim.keymap.set("n", "<C-6>", function()
      vim.cmd.ToggleTerm({ count = 5 })
    end, { desc = "Toggle 5th Terminal" })

    -- vim.keymap.set("t", "<esc>", vim.cmd.ToggleTerm)
  end,
}
