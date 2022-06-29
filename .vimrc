"================
" Configurations
"================

" global clipboard
set clipboard+=unnamedplus
" tab to 2 spaces
set ts=2 sw=2 sts=2 et ai si
" line numbers
set nu rnu
" timeout keybinding
set timeoutlen=2000

" create directory if needed
if !isdirectory($HOME.'/.vim/files') && exists('*mkdir')
  call mkdir($HOME.'/.vim/files')
endif

" backup files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
" swap files
set directory   =$HOME/.vim/files/swap//
set updatecount =100
" undo files
set undofile
set undodir     =$HOME/.vim/files/undo/
" viminfo files
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

"================
" Plugins
"================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'triglav/vim-visual-increment'

Plugin 'catppuccin/nvim', {'name': 'catppuccin'}
Plugin 'mtdl9/vim-log-highlighting'
Plugin 'joeky888/Ass.vim'

call vundle#end()

syntax on
set nocompatible
filetype plugin indent on

let g:NERDSpaceDelims = 1

"================
" Theme
"================

let g:catppuccin_flavour = 'mocha' " latte, frappe, macchiato, mocha
colorscheme catppuccin

let g:airline_extensions = ['fzf', 'unicode']
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v']) 

"================
" Keybindings
"================

nnoremap qq :q<CR>
nnoremap qQ :q<CR>
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-N> :NERDTree<CR>
" nnoremap <C-T> :NERDTreeToggle<CR>
" nnoremap <C-F> :NERDTreeFind<CR>
