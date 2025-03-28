-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'config.opts'
require 'config.keymaps'

require 'config.lazy'

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- import your plugins
    { import = 'plugins' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'habamax' } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
