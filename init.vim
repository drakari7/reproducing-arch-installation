" Plugins Section
call plug#begin('~/.config/nvim/plugged')

" Aesthetics
Plug 'itchyny/lightline.vim'

" Functionality Plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git addition to nerdtree
Plug 'airblade/vim-gitgutter'       " shows git diff
Plug 'tpope/vim-surround'           " For paranthesis
Plug 'preservim/tagbar'             " Tags implementation
Plug 'ludovicchabant/vim-gutentags' " another tags plugin

" Latex
Plug 'lervag/vimtex'

" Color schemes and highlighting
Plug 'dikiaap/minimalist'
Plug 'numirias/semshi'
Plug 'vim-python/python-syntax'

" Tab completion
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Language support
Plug 'rust-lang/rust.vim'

call plug#end()


" Setting the neovim color scheme
if (has("termguicolors"))
	set termguicolors
endif
syntax enable
colorscheme minimalist

" Semshi overwriting color groups
function MyCustomHighlights()
    hi semshiGlobal      ctermfg=red guifg=#ff0000
endfunction
autocmd FileType python call MyCustomHighlights()

let g:semshi#simplify_markup = v:false
let g:semshi#error_sign = v:true
let g:semshi#error_sign_delay = 5
"let g:semshi#excluded_hl_groups = ['local', 'unresolved', 'attribute', 'builtin', 'free', 'global', 'parameter', 'parameterUnused', 'self', 'imported']

" Adding python syntax highlighting from python-syntax plugin
"let g:python_highlight_all = 1
let g:python_highlight_builtins = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1


" Setting the status bar theme 
let g:lightline = {'colorscheme': 'powerlineish'}

" Setting up python3 for neovim
let g:python3_host_prog = '/usr/local/bin/python3'

" Activating rust plugin
filetype plugin indent on

" Latex settings
let g:tex_flavor = "latex"

" Templates for different types of files
autocmd BufNewFile *.cpp    0r ~/.config/nvim/templates/skeleton.cpp
autocmd BufNewFile *.tex    0r ~/.config/nvim/templates/skeleton.tex
autocmd BufNewFile *.py     0r ~/.config/nvim/templates/skeleton.py

" Some basic options
set number 
set whichwrap+=<,>,h,l,[,]
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab autoindent 
set encoding=utf-8 fileencoding=utf-8 fileformat=unix
set noshowmode
set clipboard+=unnamedplus
set ignorecase incsearch
let mapleader= ","

" Split below by default instead of on top
set splitbelow
set splitright

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <C-J> <ESC><C-W><C-J>
inoremap <C-K> <ESC><C-W><C-K>
inoremap <C-L> <ESC><C-W><C-L>
inoremap <C-H> <ESC><C-W><C-H>

" Mouse options
set mouse=a
let g:is_mouse_enabled = 1

" Setting auto close brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
inoremap ( ()<left>



" Trigger configuration for UltiSnips. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" You complete me options
let g:ycm_autoclose_preview_window_after_insertion = 1

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Shortcut for file tree
map <leader>n :NERDTreeToggle<CR>

" Tag list toggle
map <leader>t :TagbarToggle<CR>

" Running code from within nvim
autocmd BufWinEnter *.py nnoremap <leader>r :w<CR>:!python3 %<CR>
autocmd BufWinEnter *.sh nnoremap <leader>r :w<CR>:!sh %<CR>

" Compiling latex files
autocmd BufWinEnter *.tex nnoremap <leader>r :w<CR>:!pdflatex %<CR>

" Show highlight group for word under cursor
nmap <C-S-T> :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
