return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local h_pct = 0.90
    local w_pct = 0.80
    local w_limit = 75

    local standard_setup = {
      borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      preview = { hide_on_startup = true },
      layout_strategy = 'horizontal',
      layout_config = {
        horizontal = {
          mirror = false,
          prompt_position = 'top',
          width = function(_, cols, _)
            return cols
          end,
          height = function(_, _, rows)
            return math.floor(rows * h_pct)
          end,
          preview_cutoff = 10,
          preview_height = 0.4,
        },
      },
    }

    require('telescope').setup {
      defaults = vim.tbl_extend('error', standard_setup, {
        sorting_strategy = 'ascending',
        mappings = {
          n = {
            ['o'] = require('telescope.actions.layout').toggle_preview,
            ['<C-c>'] = require('telescope.actions').close,
          },
          i = {
            ['<C-o>'] = require('telescope.actions.layout').toggle_preview,
          },
        },
        pickers = {
          find_files = {
            find_command = {
              'fd',
              '--type',
              'f',
              '-H',
              '--strip-cwd-prefix',
            },
          },
        },
      }),
    }

    pcall(require('telescope').load_extension, 'fzf')

    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    -- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>sb', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
    vim.keymap.set('n', '<leader>sw', builtin.lsp_dynamic_workspace_symbols, { desc = '[S]earch Workspace [S]ymbols' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
