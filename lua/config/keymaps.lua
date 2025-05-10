local nmap = function(key, fn, desc)
  vim.keymap.set('n', key, fn, { desc = desc })
end

-- nmap('\\', '<cmd>Ex<CR>', '[O]pen buffers list')
--
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
nmap('<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
nmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

nmap('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
nmap('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
nmap('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
nmap('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
