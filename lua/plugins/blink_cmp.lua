return {
  'Saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        -- {
        --   'rafamadriz/friendly-snippets',
        --   config = function()
        --     require('luasnip.loaders.from_vscode').lazy_load()
        --   end,
        -- },
      },
      opts = {},
    },
    'Kaiser-Yang/blink-cmp-avante',
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      -- trigger = { prefetch_on_insert = false },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'avante' }, --'minuet'
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
          opts = {
            -- options for blink-cmp-avante
          },
        },

        -- minuet = {
        --   name = 'minuet',
        --   module = 'minuet.blink',
        --   async = true,
        --   -- Should match minuet.config.request_timeout * 1000,
        --   -- since minuet.config.request_timeout is in seconds
        --   timeout_ms = 3000,
        --   score_offset = 50, -- Gives minuet higher priority among suggestions
        -- },
      },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
