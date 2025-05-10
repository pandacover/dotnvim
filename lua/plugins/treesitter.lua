return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = { 'c', 'rust' },
      additional_vim_regex_highlighting = { 'ruby' },
    },
  indent = { enable = true, disable = { 'ruby' } },
  },
}
