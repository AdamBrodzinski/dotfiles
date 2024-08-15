local function current_directory()
  local dir = vim.fn.getcwd()
  local dir_name = vim.fn.fnamemodify(dir, ":t")
  return dir_name
end

local function get_filepath()
  local filepath = vim.fn.expand("%:p")
  local parts = {}

  -- Split the filepath into parts
  for part in string.gmatch(filepath, "([^/]+)") do
    table.insert(parts, part)
  end

  -- Get the last 3 parts (2 folders + filename)
  local result = table.concat(parts, "/", #parts - 2, #parts)

  return filepath
  --  return result
end

-- Example usage: setting this as a statusline component
--vim.opt.statusline = "%!v:lua.get_filepath()"

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      -- section_separators = "",
      -- component_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { get_filepath },
      lualine_x = {},
      lualine_y = { "location" },
      lualine_z = { current_directory },
    },
  },
}
