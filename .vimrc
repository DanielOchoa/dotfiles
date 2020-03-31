" Dany's VIM config

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-endwise'
" example, ` cs"' ` will change single to double quotes
Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-rails' // removing since I don't plan to use rails anytime soon
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'groenewege/vim-less'
Plugin 'kien/ctrlp.vim'
Plugin 'rstacruz/sparkup'
Plugin 'rking/ag.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'wting/rust.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'MaxMEllon/vim-jsx-pretty'
" Plugin 'chase/vim-ansible-yaml' // have not used ansible in a long time
Plugin 'moll/vim-node'
" Plugin 'geekjuice/vim-mocha' // deprecate since I don't use it
Plugin 'junegunn/vim-easy-align'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'w0rp/ale'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'mhinz/vim-mix-format'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'fatih/vim-go'
" color schemes
Plugin 'rakr/vim-one'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'junegunn/seoul256.vim'

" autocompletion with deoplete - see README.md for setup (deps on python3 and some python libs)
" https://github.com/Shougo/deoplete.nvim/issues/675
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
call vundle#end()

imap <C-c> <CR><Esc>O

syntax on
filetype plugin indent on

" Theme
syntax enable

" color
let g:one_allow_italics = 1
color one
set background=dark

" Italic support inside tmux
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set guifont=Monaco:h12
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

" spellcheck
"set spelllang=en_us
"set spell

" Personal prefs:
set shiftwidth=2
set softtabstop=2
set expandtab

set number
set wrap
set textwidth=115
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set colorcolumn=+1
highlight ColorColumn ctermbg=235 guibg=#333435

" vim airline
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Map esc
:inoremap jj <Esc>

" Splits remap - CTRL-H/CTRL-L
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Cool defaults
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set cursorcolumn
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" Makes things slow.. disable for now
" set relativenumber
set number
set undofile
set regexpengine=1
set lazyredraw
" No newline at end of file
set nofixendofline

" mapleader!
let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap ; :

" Visual shifting (does not exit Visual mode on tab)
vnoremap < <gv
vnoremap > >gv

" Auto format comment blocks
set comments=sl:/*,mb:*,elx:*/

" Save our file everytime we lose focus :)
au FocusLost * :wa

" Splitting!
nnoremap <leader>w <C-w>v<C-w>l

" indent every line in the file
nnoremap <Leader>i mmgg=G`m

" Flog
:silent exe "g:flog_enable"

" MacVim settings
set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h14

" Removes trailing spaces when vim writes
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

" Jumps to next line while in insert mode
:inoremap kk <C-O>o

noremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Makes tmux c/p work
set clipboard=unnamed

" This if is to make these bindings work inside tmux
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" Backup swap files
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set viminfo+=n~/.vim/viminfo

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
end
" Fly mode - jiangmiao/auto-paris
let g:AutoPairsFlyMode = 0
"let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutBackInsert = '<leader>m'

" Ctrlp plugin options
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/dist/*,*/node_modules/*,*/bower_components/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tmp|vim|dist)$'

" vim-jsx
let g:jsx_ext_required = 0

" vim mocha
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1

" File Type specific settings using `Filetype`
"" Golang
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 noexpandtab

" Prettier integration with ale plugin
let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'handlebars': ['ember-template-lint']}
let g:ale_fix_on_save = 0

" Uncomment following line to use Prettier config files and have ALE respect them.
let g:ale_javascript_prettier_use_local_config = 1

" JsDoc
map <Leader>d :JsDoc

" auto complete with deoplete
let g:deoplete#enable_at_startup = 1
