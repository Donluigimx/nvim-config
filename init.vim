call plug#begin()
  " Fuzzy Searcher, requires Silver Searcher (ag) and Ripgrep (rg)
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " VSCode like completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Snippets that works with coc
  Plug 'honza/vim-snippets'
  Plug 'grvcoelho/vim-javascript-snippets'

  " Plugins for JSX, javascript and svelte
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'leafOfTree/vim-svelte-plugin'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'

  " Required plugin for coc-flutter
  Plug 'dart-lang/dart-vim-plugin'

  " Lua line plugins
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  " Copilot
  Plug 'github/copilot.vim'
call plug#end()

" set tabspace to 2
set expandtab tabstop=2 shiftwidth=2

" Loads configuration for multiple plugins
source $HOME/.config/nvim/modules/coc.vim
source $HOME/.config/nvim/modules/lualine.vim
source $HOME/.config/nvim/modules/devicons.vim

let &l:include = 'from\|require'
set number
nnoremap <C-p> :Files<CR>
nnoremap <Space>p :Files 
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

" Fast way to switch between tabs
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>

" Fast way to switch between panels
nmap <leader>h :wincmd h<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>

" Replace default copilot completion keybind
imap <silent><script><expr> <C-Q> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
