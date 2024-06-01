-- Load before Lazy
vim.g.mapleader = ' '

-- Enable 24-bit colors
vim.opt.termguicolors = true

-- Width of tabs
vim.opt.shiftwidth = 4

-- Show number of line
vim.opt.number = true

-- Don't highlight while searching word
vim.o.hlsearch = false

-- Keymap for navigating through windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

