-- note indent-blankline.nvim is also used but mini.indentscope is for visuals
return {
  "echasnovski/mini.indentscope",
  opts = {
    symbol = "▏",
    -- symbol = "│",
    draw = {
      animation = function()
        return 0
      end,
    },
  },
}
