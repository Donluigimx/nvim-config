-- Load lazy plugin manager
require('modules.lazy')

-- Load plugins
require('modules.plugins')

-- Load custom modules
require('modules.lualine')
require('modules.devicons')
require('modules.lsp')
require('modules.fzf')
require('modules.flutter')
require('modules.conform')

-- set theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('flexoki-dark')

-- Set tabspace to 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = ""

-- Define include patterns
vim.g.include = 'from\\|require'

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- New File on new tab
vim.keymap.set('n', '<space>nf', ':tabnew %')
vim.keymap.set('n', '<space>nF', ':tabnew %:h/') -- New file in the same buffer directory

-- Custom remaps for prettier and go formatter
vim.keymap.set('n', 'gp', ':silent %!npx prettier --stdin-filepath %<CR>')
vim.keymap.set('n', 'gofmt', ':silent %!gofmt %<CR>')
vim.keymap.set('n', 'ffmt', ':silent %!gofmt %<CR>')

-- Copy/paste from local clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>Y', ':w !pbcopy<CR>')

-- Fast way to switch between tabs
vim.keymap.set('n', '<C-h>', ':tabprevious<CR>')
vim.keymap.set('n', '<C-l>', ':tabnext<CR>')

-- Replace default Copilot completion keybind
vim.keymap.set('i', '<C-q>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
