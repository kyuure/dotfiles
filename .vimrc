" source: Mental Outlaw - https://www.youtube.com/watch?v=nOhlk3mpgmM
"       : ThePrimeagen - https://www.youtube.com/watch?v=n9k9scbTuvQ
"               https://github.com/awesome-streamers/awesome-streamerrc/tree/master/ThePrimeagen
"       : Nick Janetakis - https://www.youtube.com/watch?v=1f8h45YR494
"       : Takuya Matsuyama - https://www.youtube.com/watch?v=sSOfr2MtRU8
"               https://github.com/craftzdog/dotfiles-public
"       : Junnegun Choi - https://github.com/junegunn/dotfiles/blob/master/vimrc
"       : David Barnett - https://github.com/dbarnett/dotfiles/blob/master/.vimrc


" set mouse enabled
set mouse=nv
" scroll when i'm 5 away from the edge
set scrolloff=5
" too lazy to redraw while executing macros
set lazyredraw
" highlights searches
set hlsearch
" does searches incremenentaly
set incsearch
" case-insensitive
set ignorecase
" the bells was like a jumpscare for me :(
set belloff=all

" converts tabs to spaces
set expandtab
set smartindent
set smarttab
" sets tab size to 2 whitespaces, but it doesn't affect in Python.
set tabstop=2
set softtabstop=2
set shiftwidth=2
" displaying tabs as a character
set list
set listchars=tab:»\ ,extends:@,precedes:^
" so that backspace works like it used to be
set backspace=indent,eol,start

" make one line exactly one line
set nowrap
" sets the line numbering
set number relativenumber
" set edge for maxlength
set colorcolumn=80
" recently vim can merge signcolumn and number column into one
set signcolumn=number
" format to unix
set fileformat=unix
" encoding
set encoding=UTF-8
" for syntax highlights
syntax on

" splits open at the bottom and right; ctrl+w+v
set splitbelow splitright
" enable plugin for abbreviations [:ab] and netrw
filetype plugin on
" command line completion
set wildmenu
set wildmode=longest,list,full
set completeopt=menuone,preview

" default clipboard and multi-platform
set clipboard^=unnamed,unnamedplus
" new backup place
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" to... auto read.
set autoread
" delete all macros when exit
set viminfo='100,<0,s10,h

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=80
" disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" mmmmmmmm
set hidden
" for lightline
set laststatus=2

" cursor line
"set cursorline
"highlight CursorLine ctermbg=Black cterm=NONE

" don't change the background >:(;
highlight Normal ctermbg=NONE
highlight LineNr ctermfg=Magenta
highlight Statement ctermfg=Blue
highlight Identifier ctermfg=Yellow
highlight Comment cterm=italic


" Command for update and upgrade plug
" source: https://github.com/junegunn/vim-plug/wiki/faq#shouldnt-vim-plug-update-itself-on-plugupdate-like-vundle
command! PU PlugUpdate | PlugUpgrade
" PLUGGINS
call plug#begin('~/.vim/plugged')

" Autocompletion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = [
              \   'coc-clangd',
              \   'coc-css',
              \   'coc-explorer',
              \   'coc-html',
              \   'coc-json',
              \   'coc-pyright',
              \   'coc-python',
              \   'coc-sh',
              \]
highlight CocFloating ctermbg=Black
"highlight CocFloating ctermbg=White

" fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

" auto pairs
  Plug 'jiangmiao/auto-pairs'

" git for vim
"  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/vim-gitbranch'

" Lightline
  Plug 'itchyny/lightline.vim'

" NERDFonts. should i use this or hmm :(
  Plug 'ryanoasis/vim-devicons'

" InTeReStInG
"  Plug 'junegunn/goyo.vim'
"  Plug 'junegunn/gv.vim'

call plug#end()


"=== === === === === === === === === === === === === === === === === === === ===
"  g i t
"=== === === === === === === === === === === === === === === === === === === ===
autocmd Filetype gitcommit setlocal spell textwidth=72


"=== === === === === === === === === === === === === === === === === === === ===
" IMPORTS
"=== === === === === === === === === === === === === === === === === === === ===
source ~/.vimrc.lightline
source ~/.vimrc.maps
