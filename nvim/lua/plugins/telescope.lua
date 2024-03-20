return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- fuzzy search support
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' },

    {
      'nvim-telescope/telescope-file-browser.nvim',
      dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of help_tags options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`

    local actions = require 'telescope.actions'

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = actions.close,
          },
        },
        file_ignore_patterns = {
          'node_modules/',
          'vendor/',
          '%.svg',
          '%.png',
          '%.jpg',
          '%.woff2',
        },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'file_browser')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind  [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind  [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind  [F]iles' })
    vim.keymap.set('n', '<leader>fst', builtin.builtin, { desc = '[F]ind  [S]elect [T]elescope' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind  current [W]ord' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind  by [G]rep' })
    -- remap to <leader>fe ?
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind  [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind  [R]esume' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>fs', function()
      builtin.grep_string { search = vim.fn.input 'Grep >' }
    end, { desc = 'search' })

    vim.keymap.set('n', '<leader>fR', builtin.lsp_references, { desc = '[F]ind [R]eferences' })
    vim.keymap.set('n', '<leader>fD', builtin.lsp_definitions, { desc = '[F]ind [D]efinition' })
    vim.keymap.set('n', '<leader>fi', builtin.lsp_type_definitions, { desc = '[F]ind [I]mplementation?' })

    -- file tree
    vim.api.nvim_set_keymap('n', '<space>ft', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true, desc = '[F]ind file [T]ree' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[F]ind [/] in Open Files' })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set('n', '<leader>fv', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[F]ind [V]im files' })

    vim.api.nvim_set_keymap('n', '<leader>st', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
  end,
}
