return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "[F]ind existing buffers" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[F]ind by [G]rep" },
    { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "[F]ind [R]esume" },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = "close",
        },
      },
    },
  },
}
