local function current_directory()
  local dir = vim.fn.getcwd()
  local dir_name = vim.fn.fnamemodify(dir, ":t")
  return dir_name
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { current_directory, "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
