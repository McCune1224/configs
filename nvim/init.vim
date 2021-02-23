" LEADER KEY
let mapleader = " " 

 "House Keeping for Vim-Plug
set nocompatible

" Required for Vim-Plugged
filetype off

call plug#begin('~/.config/nvim/plugged')
" ~~~~~~~~~~~~~~~

"BIG BOY LANGUAGE SERVER BABY
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Debugger
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Code Commenter
Plug 'preservim/nerdcommenter'

" Material Theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" File Explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'

" Fuzzy Search
Plug 'ctrlpvim/ctrlp.vim'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ~~~~~~~~~~~~~
call plug#end()

" Required for Vim-Plugged
filetype plugin indent on


" Syntax and Code Format stuff
syntax on
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set noerrorbells
set ignorecase

" Highlight Search
set hlsearch
map <silent> <leader>h :nohlsearch<CR>

set hidden
set clipboard=unnamedplus


" Hybrid Nums
set nu! rnu!

" Window Resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>



" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" P L U G I N  S E T T I N G S



"COC SOURCE INIT FILE
source $HOME/.config/nvim/plug-config/coc.vim



" Airline Settings 
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1

" removes --INSERT-- and such since airline now displays it
set noshowmode


" True Colors :)
if (has('termguicolors'))
  set termguicolors
endif

" Color Scheme
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
colorscheme material

map <silent> <C-n> :NERDTreeToggle<CR>


" Ctrlp Fuzzy Find
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'



" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint
