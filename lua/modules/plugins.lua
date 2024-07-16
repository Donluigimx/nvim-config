require('lazy').setup({
  -- LSP plugins

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
  }, -- specific for flutter
  {'dart-lang/dart-vim-plugin'}, -- specific for dart

  -- Themes
  {'ellisonleao/gruvbox.nvim'},
  {'kepano/flexoki-neovim'},

  -- File explorer
  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},

  -- Current theme
  {'folke/tokyonight.nvim'},

  -- tpope plugins
  {'tpope/vim-surround'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-commentary'},

  -- Cosmetics 💅
  {'nvim-lualine/lualine.nvim'},
  {'kyazdani42/nvim-web-devicons'},

  -- shitty ai
  {'github/copilot.vim'},
})

