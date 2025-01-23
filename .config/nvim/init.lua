require("config.lazy")

vim.opt.number = true -- Enable line numbering

-- Sensible default settings
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Relative line numbers
vim.opt.tabstop = 4                -- Number of spaces tabs count for
vim.opt.shiftwidth = 4             -- Number of spaces for autoindents
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.smartindent = true         -- Auto-indent new lines
vim.opt.wrap = true                -- Wrap lines
vim.opt.cursorline = true          -- Highlight the current line
vim.opt.incsearch = true           -- Incremental search
vim.opt.ignorecase = true          -- Ignore case when searching
vim.opt.smartcase = true           -- Override ignorecase if search contains uppercase

-- Enable mouse support
vim.opt.mouse = 'a'

-- Set leader key to space (optional)
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':x!<CR>', { noremap = true, silent = true })
