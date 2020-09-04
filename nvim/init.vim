" Plugins Section
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'dikiaap/minimalist'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()


" Setting the neovim color scheme
if (has("termguicolors"))
	set termguicolors
endif

" Setting the status bar theme 
let g:lightline = { 'colorscheme': 'powerlineish'}

" Setting up python3 for neovim
let g:python3_host_prog = '/usr/bin/python3'

" Setting the colorscheme
syntax enable
colorscheme minimalist

" Some basic options
set number relativenumber
set whichwrap+=<,>,h,l,[,]
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab autoindent fileformat=unix
set noshowmode
set clipboard+=unnamedplus
set ignorecase incsearch
let mapleader= ","

" Map shortcut for file tree
map <C-t> :NERDTreeToggle<CR>

" Templates for different types of files
autocmd BufNewFile *.cpp    0r ~/.config/nvim/templates/skeleton.cpp
autocmd BufNewFile *.tex    0r ~/.config/nvim/templates/skeleton.tex


" Setting auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Trigger configuration for UltiSnips. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Setting up YouCompleteMe for Vimtex
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" Latex settings
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'Zathura'
