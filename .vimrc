" source: Mental Outlaw - https://www.youtube.com/watch?v=nOhlk3mpgmM
"       : ThePrimeagen - https://www.youtube.com/watch?v=n9k9scbTuvQ
"               https://github.com/awesome-streamers/awesome-streamerrc/tree/master/ThePrimeagen
"       : Nick Janetakis - https://www.youtube.com/watch?v=1f8h45YR494
"       : Takuya Matsuyama - https://www.youtube.com/watch?v=sSOfr2MtRU8
"               https://github.com/craftzdog/dotfiles-public
"       : Junnegun Choi - https://github.com/junegunn/dotfiles/blob/master/vimrc


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
" turn out cursorline entertain me lol but still no
set nocursorline
" find like fuzzy finder :find <filename_to_regex>
set path+=**
" the bells was like a jumpscare for me :(
set belloff=all

" sets tab size to 4 whitespaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" only for html
autocmd FileType html setlocal ts=2 sts=2 sw=2

" converts tabs to spaces
set expandtab
set smartindent
set autoindent
" displaying tabs as a character
set list
set listchars=tab:\|\ ,
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
" show keystroke
set showcmd
set noru
" don't change the background >:(;highlight Normal guibg=none

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"let g:user_emmet_mode='n'
let g:user_emmet_leader_key='<C-D>'


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
                \   'coc-tsserver',
                \   'coc-xml'
                \]
highlight CocFloating ctermbg=Black guibg=#3b3750
"highlight CocFloating ctermbg=White guibg=#c4c8af
" CocErrorFloat CocHelperNormalFloat CocHintFloat CocInfoFloat CocWarningFloat 

" emmet
    Plug 'mattn/emmet-vim'

" fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

" auto pairs
    Plug 'jiangmiao/auto-pairs'

" git for vim
"    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/vim-gitbranch'

" Lightline
    Plug 'itchyny/lightline.vim'

" NERDFonts. should i use this or hmm :(
    Plug 'ryanoasis/vim-devicons'

" InTeReStInG
"    Plug 'junegunn/goyo.vim'
"    Plug 'junegunn/gv.vim'

call plug#end()

"=== === === === === === === === === === === === === === === === === === === ===
"  g i t
"=== === === === === === === === === === === === === === === === === === === ===
"autocmd Filetype gitcommit setlocal spell textwidth=72


"=== === === === === === === === === === === === === === === === === === === ===
" IMPORTS
"=== === === === === === === === === === === === === === === === === === === ===
source ~/.vimrc.lightline
source ~/.vimrc.maps
