call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  Plug 'grvcoelho/vim-javascript-snippets'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'pangloss/vim-javascript'
  Plug 'evanleck/vim-svelte', {'branch': 'main'}
  Plug 'dart-lang/dart-vim-plugin'

  " Lua line plugins
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

set expandtab tabstop=2 shiftwidth=2
" autocmd FileType python setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
let &l:include = 'from\|require'
set number
nnoremap <C-p> :Files<CR>
set number relativenumber

source $HOME/.config/nvim/modules/coc.vim
source $HOME/.config/nvim/modules/lualine.vim
source $HOME/.config/nvim/modules/devicons.vim

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .gitignore --ignore .git --ignore .vscode --ignore node_modules --ignore dist -l -g ""'

nnoremap gp :silent %!npx prettier --stdin-filepath %<CR>
nnoremap gofmt :silent %!gofmt %<CR>
nnoremap ffmt :silent %!gofmt %<CR>

map <silent> <leader>y "+y
map <silent> <leader>p "+p
nmap <silent> <leader>Y :%w !pbcopy <CR>

" vimsense configuration
let g:vimsence_small_text = 'Vim'
let g:vimsence_small_image = 'vim'
let g:vimsence_editing_details = 'Moviéndole a {}'
let g:vimsence_editing_state = 'Chambeando en {}'
