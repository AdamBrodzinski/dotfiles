return {
  'folke/trouble.nvim',
  wrap = true,
  keys = {
    { '<leader>fep', '<cmd>TroubleToggle<cr>', desc = '[F]ind [E]rrors in [P]roject' },
    { '<leader>fed', '<cmd>TroubleToggle document_diagnostics<cr>', desc = '[F]ind [E]rrors in [D]ocument' },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
