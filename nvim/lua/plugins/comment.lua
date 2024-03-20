-- "gc" to comment visual regions/lines
-- https://github.com/numToStr/Comment.nvim
-- TODO: replace with https://github.com/echasnovski/mini.comment
return {
  'numToStr/Comment.nvim',
  keys = {
    -- terminal binding for Cmd /
    '<Esc>cmdc',
  },
  opts = {
    toggler = {
      line = '<Esc>cmdc',
    },
    opleader = {
      line = '<Esc>cmdc',
    },
  },
}
