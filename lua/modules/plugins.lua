require('lazy').setup({
  -- LSP plugins

  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },                               -- specific for flutter
  { 'dart-lang/dart-vim-plugin' }, -- specific for dart
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate"
  },

  -- Themes
  { 'ellisonleao/gruvbox.nvim' },
  { 'kepano/flexoki-neovim' },

  -- File explorer
  { 'junegunn/fzf' },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- tpope plugins
  { 'tpope/vim-surround' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-commentary' },

  -- Cosmetics 💅
  { 'nvim-lualine/lualine.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  -- shitty ai
  { 'github/copilot.vim' },

  -- formatter
  { 'stevearc/conform.nvim' },
})
