return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- manually setup lspconfig for languages that prefer to use the
      -- lsp installed for the current language version instead of Mason
      servers = {
        gleam = {},
        ocamllsp = {},
      },
    },
  },
}
