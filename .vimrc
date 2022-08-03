" source: Mental Outlaw - https://www.youtube.com/watch?v=nOhlk3mpgmM
"       : ThePrimeagen - https://www.youtube.com/watch?v=n9k9scbTuvQ
"               https://github.com/awesome-streamers/awesome-streamerrc/tree/master/ThePrimeagen
"       : Nick Janetakis - https://www.youtube.com/watch?v=1f8h45YR494
"       : Takuya Matsuyama - https://www.youtube.com/watch?v=sSOfr2MtRU8
"               https://github.com/craftzdog/dotfiles-public
"       : Junnegun Choi - https://github.com/junegunn/dotfiles/blob/master/vimrc
"       : David Barnett - https://github.com/dbarnett/dotfiles/blob/master/.vimrc


" set mouse enabled
" change this from nv to a because coc.nvim can scroll through float window by using mouse
" well, it can scroll with keyboard (see https://github.com/neoclide/coc.nvim/issue/609
" and htpps://github.com/neoclide/coc.nvim/discussions/2472), but i dont have time
" to change  atm.
set mouse=a
" scroll when i'm 5 away from the edge
set scrolloff=5

" the bells was like a jumpscare for me :(
set belloff=all

" too lazy to redraw while executing macros
set lazyredraw
" highlights searches
set hlsearch
" does searches incremenentaly
set incsearch
" case-insensitive
set ignorecase

" for syntax highlights
syntax on

" converts tabs to spaces
set expandtab
set smarttab
" sets tab size to 2 whitespaces, but it doesn't affect in Python.
set tabstop=2
set softtabstop=2
set shiftwidth=2
" displaying tabs as a character
set list
set listchars=tab:»\ ,extends:>,precedes:<,trail:-
" so that backspace works like it used to be
set backspace=indent,eol,start
" smart indent
set smartindent
filetype plugin indent on
filetype indent on

" make one line exactly one line
set nowrap
" sets the line numbering
set number "relativenumber
" recently vim can merge signcolumn and number column into one
set signcolumn=number
" set edge for maxlength
set colorcolumn=80
" format to unix
set fileformat=unix
" encoding
set encoding=UTF-8

" enable plugin for abbreviations [:ab] and netrw
filetype plugin on

" splits open at the bottom and right; ctrl+w+v
set splitbelow splitright
" command line completion
set wildmenu
set wildmode=longest,list,full
set completeopt=menuone,preview
" for lightline
set laststatus=2

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

" git commit
autocmd filetype gitcommit setlocal spell textwidth=72


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
              \   'coc-go',
              \   'coc-html',
              \   'coc-json',
              \   'coc-pyright',
              \   'coc-sh',
              \]

" for golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  let g:go_decls_includes = "func,type"
  " Use new vim 8.2 popup windows for Go Doc
  let g:go_doc_popup_window = 1
  " dont autoformat
  let g:go_fmt_autosave = 0
  let g:go_asmfmt_autosave = 0

" fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  "let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" auto pairs
  Plug 'jiangmiao/auto-pairs'
  let g:AutoPairsShortcutFastWrap = '<M-s>'
  au FileType html let b:AutoPairs = AutoPairsDefine({'<!--':'-->', '/*':'*/'})
  au FileType tex let b:AutoPairs = AutoPairsDefine({'$':'$'})
  au FileType ruby let b:AutoPairs = AutoPairsDefine({'|':'|'})

" git for vim
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }

" Lightline
  Plug 'itchyny/lightline.vim'

" just for icon on lightline and coc-explorer
  Plug 'ryanoasis/vim-devicons'

" for autofocus
  Plug 'junegunn/limelight.vim'
  let g:limelight_conceal_ctermfg = 'grey'
  let g:limelight_conceal_ctermfg = 240
  " preceding/following paragraphs to include
  let g:limelight_paragraph_span = 1

"  Plug 'junegunn/goyo.vim'

call plug#end()


"=== === === === === === === === === === === === === === === === === === === ===
" IMPORTS
"=== === === === === === === === === === === === === === === === === === === ===
source ~/.vim/rc/.vimrc.fold
source ~/.vim/rc/.vimrc.lightline
source ~/.vim/rc/.vimrc.maps
source ~/.vim/rc/.vimrc.colors
source ~/.vim/rc/.vimrc.coc-explorer
