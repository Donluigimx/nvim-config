call plug#begin()
  " Fuzzy Searcher, requires Silver Searcher (ag) and Ripgrep (rg)
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " VSCode like complition
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Snippets that works with coc
  Plug 'honza/vim-snippets'
  Plug 'grvcoelho/vim-javascript-snippets'

  " Plugins for JSX, javascript and svelte
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'evanleck/vim-svelte', {'branch': 'main'}

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'

  " Required plugin for coc-flutter
  Plug 'dart-lang/dart-vim-plugin'

  " Lua line plugins
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" Loads configuration for multiple plugins
source $HOME/.config/nvim/modules/coc.vim
source $HOME/.config/nvim/modules/lualine.vim
source $HOME/.config/nvim/modules/devicons.vim

let &l:include = 'from\|require'
set number
nnoremap <C-p> :Files<CR>
set number relativenumber

" Custom FZF command
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .gitignore --ignore .git --ignore .vscode --ignore node_modules --ignore dist -l -g ""'

" Custom remaps for prettier and go formatter
nnoremap gp :silent %!npx prettier --stdin-filepath %<CR>
nnoremap gofmt :silent %!gofmt %<CR>
nnoremap ffmt :silent %!gofmt %<CR>

" Allows to copy/paste from local clipboard
map <silent> <leader>y "+y
map <silent> <leader>p "+p
nmap <silent> <leader>Y :%w !pbcopy <CR>
