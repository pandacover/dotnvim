local g = vim.g
local o = vim.opt

g.mapleader = ' '
g.maplocalleader = '\\'

g.have_nerd_font = true

o.number = true
o.relativenumber = true
o.mouse = 'a'
o.showmode = false

vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = 'yes'
o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand = 'split'
o.cursorline = true
o.scrolloff = 10
o.confirm = true
o.laststatus = 3
