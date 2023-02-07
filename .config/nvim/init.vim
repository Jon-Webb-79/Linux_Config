" ================================================================================
" ================================================================================
" File:      init.vim
" Date:      February 22, 2022
" Purpose:   This file contains all information necessary to format and operate
"            the NeoVim editor
" Author:    Jonathan A. Webb
" Copyright: Copyright 2022, Jon Webb INc.
" Version:   1.0
" ================================================================================
" ================================================================================
" 1. Basic information

:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

iab <expr> r90= repeat('=', 90)
iab <expr> r90- repeat('-', 90)
iab <expr> shebang repeat('#!/usr/bin/bash', 1)
iab <expr> zbang repeat('#!/usr/bin/zsh', 1)

set clipboard=unnamed
set guifont=Monaco:h40
" ================================================================================
" 2. Bundle

call plug#begin()

Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'fisadev/FixedTaskList.vim'
Plug 'christoomey/vim-tmux-navigator'
" --------------------------------------------------------------------------------
" 2.1 HTML bundles

Plug 'jtratner/vim-flavored-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'nelstrom/vim-markdown-preview'
" --------------------------------------------------------------------------------
"  2.2 Python bundles

Plug 'nvie/vim-flake8'
Plug 'tmhedberg/SimpylFold'
Plug 'jmcantrell/vim-virtualenv'
" --------------------------------------------------------------------------------
"  2.3. LaTeX

Plug 'vim-latex/vim-latex'
call plug#end()
" ================================================================================
" NERDTree add ons
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

"let g:NERDTreeDirArrowExpandable="+"
"let g:NERDTreeDirArrowCollapsible="~"
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face

augroup nerdtree
    autocmd!
    autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
    autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

" Toggle NERDTree
function! ToggleNerdTree()
    if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
        :NERDTreeFind
    else
        :NERDTreeToggle
    endif
endfunction
" toggle nerd tree
nmap <silent> <leader>n :call ToggleNerdTree()<cr>
" find the current file in nerdtree without needing to reload the drawer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
 let NERDTreeDirArrowExpandable = '▷'
 let NERDTreeDirArrowCollapsible = '▼'

let g:NERDTreeGitStatusIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }
" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-pyright
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

syntax on
:colorscheme onedark
" ================================================================================
" 3. Formatting

let g:ale_linters = { 'python': ['flake8']}
" -------------------------------------------------------------------------------- 

" 2.d. custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" 2.e. I don't like swap files
set noswapfile
" ================================================================================ 
" ================================================================================ 
" 3. General Python formatting

autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
filetype indent plugin on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
" ================================================================================ 
" ================================================================================ 
" 4. vim command keys

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Better command line complete
set wildmenu

" Show partial command sin list line of screen
set showcmd

" Highlight searches use <C-L> to temporarily turn on highlighting
set incsearch
set hlsearch

" Use case insensitive search, except when using capital letters

" - Display the cursor position on the last line of the screen or in 
"   the status bar
set ruler 

" Display status line, even if only one window is displayed
set laststatus=2

" Enable mouse
set mouse=a

" - Set command window height to 2 lines, to avoid many cases of having to
"   press <enter> to continue
set ignorecase
set smartcase

" Blink curor on error, instead of beeping
set visualbell

" Highlight matching parenthesis
set showmatch

nnoremap <leader>sv :source &MYVIMRC<CR>
" ================================================================================ 
" ================================================================================ 
" 5. TMUX Config

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif
" ================================================================================
" ================================================================================
" eof
"
