return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = function()
    return {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "File Explorer",
      },
    }
  end,
  opts = {
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
    filesystem = {
      filtered_items = {
        show_hidden_count = false,
        hide_by_pattern = {
          "*.d.ts",
          "*.json",
          "*.lock",
          "*.md",
          "*.opam*",
          "*.plantuml",
          "*.toml",
          "*.yml",
          "*config*",
        },
        hide_by_name = {
          "_build",
          "app.html",
          "build",
          "bun.lockb",
          "Dockerfile",
          "dune",
          "dune-project",
          "Makefile",
          "node_modules",
          "public",
          "static",
          "webpack",
        },
        never_show = {
          ".DS_Store",
        },
      },
      follow_current_file = { enabled = true },
    },
  },
}
