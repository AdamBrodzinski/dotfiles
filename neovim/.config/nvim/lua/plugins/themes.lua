return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      on_colors = function(colors)
        colors.border = "#6d6dc1"
      end,
    },
  },
  {
    "neanias/everforest-nvim",
  },
}
