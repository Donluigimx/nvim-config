local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- LSP plugins
  {'folke/tokyonight.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},
  {'folke/tokyonight.nvim'},
  {'tpope/vim-surround'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-commentary'},
  {'dart-lang/dart-vim-plugin'},
  {'nvim-lualine/lualine.nvim'},
  {'kyazdani42/nvim-web-devicons'},
  {'github/copilot.vim'},
})

-- Load the modules
require('modules.lualine')
require('modules.devicons')
require('modules.lsp')

-- set theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

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

-- Custom FZF command
vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .gitignore --ignore .git --ignore .vscode --ignore node_modules --ignore dist -l -g ""'

vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', { noremap = true })

-- Custom remaps for prettier and go formatter
vim.api.nvim_set_keymap('n', 'gp', ':silent %!npx prettier --stdin-filepath %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gofmt', ':silent %!gofmt %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ffmt', ':silent %!gofmt %<CR>', { noremap = true })

-- Copy/paste from local clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Y', ':w !pbcopy<CR>', { noremap = true })

-- Fast way to switch between tabs
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true })

-- Replace default Copilot completion keybind
vim.keymap.set('i', '<C-q>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
