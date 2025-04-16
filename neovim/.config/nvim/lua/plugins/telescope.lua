local builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    return {
      { "<leader><leader>", builtin.buffers, desc = "Find existing buffers" },
      { "<leader>fD", builtin.lsp_definitions, desc = "Find LSP Definitions" },
      {
        "<leader>fd",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Find LSP Definitions",
      },
      { "<leader>fI", builtin.lsp_implementations, desc = "Find LSP Implementations" },
      { "<leader>fR", builtin.lsp_references, desc = "Find LSP References" },
      { "<leader>fE", builtin.diagnostics, desc = "Find Errors" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>fg", builtin.live_grep, desc = "Find by Grep" },
      { "<leader>fr", builtin.resume, desc = "Find Resume" },
    }
  end,
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = "close",
        },
      },
      file_ignore_patterns = {
        "priv/static/images/*",
        "priv/static/scripts/*",
        "priv/static/styles/*",
      },
    },
  },
}
