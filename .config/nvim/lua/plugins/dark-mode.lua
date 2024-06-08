return {
  "f-person/auto-dark-mode.nvim",
  config = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.cmd("colorscheme tokyonight")
    end,
    set_light_mode = function()
      vim.cmd("colorscheme tokyonight-day")
    end,
  },
}
