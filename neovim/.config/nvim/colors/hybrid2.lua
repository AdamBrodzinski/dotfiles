local M = {}

function M.setup()
  -- Define your color palette
  local colors = {
    bg = "#22211f",
    -- fg = "#abb2bf",
    red = "#e06c75",
    green = "#98c379",
    -- yellow = "#e5c07b",
    -- blue = "#61afef",
    -- magenta = "#c678dd",
    -- cyan = "#56b6c2",
    white = "#ffffff",
    --black = "#000000",
    -- Add more colors as needed
    sand = "#f7f4c3",
    comment = "#53504b",
  }
  local bg = colors.bg

  -- Clear existing highlights
  vim.cmd("highlight clear")

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Set the background (light or dark)
  vim.o.background = "dark"
  vim.g.colors_name = "hybrid2"

  -- Helper function to set highlights
  local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Set highlights for basic syntax elements
  hi("Normal", { fg = colors.fg, bg = bg })
  hi("Comment", { fg = colors.comment, italic = true })
  hi("Constant", { fg = colors.red })
  hi("String", { fg = colors.sand })
  hi("Identifier", { fg = colors.white })
  hi("Statement", { fg = colors.white })
  hi("Type", { fg = colors.white })
  hi("Special", { fg = colors.white })
  --  hi("Underlined", { fg = colors.white, underline = true })
  hi("Todo", { fg = colors.white, bg = colors.bg, bold = true })
end

M.setup()
return M
