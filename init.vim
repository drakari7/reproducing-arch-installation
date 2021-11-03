<<<<<<< HEAD
"--------------------Plugins Section -------------------------
call plug#begin('~/.config/nvim/plugged')


" TODO : modernise some plugins which have lua versions
" Functionality Plugins
Plug 'tpope/vim-unimpaired'         " Symmetric mappings
Plug 'tpope/vim-commentary'         " Easy comments
Plug 'tpope/vim-surround'           " change surroundings
Plug 'mhinz/vim-startify'           " Startpage
Plug 'vim-syntastic/syntastic'      " Linting
Plug 'gennaro-tedesco/nvim-peekup'  " Register management
Plug 'folke/which-key.nvim'         " easy keymap access

" Git integration
Plug 'airblade/vim-gitgutter'       " Shows changed lines
Plug 'tpope/vim-fugitive'           " Git commands in nvim
Plug 'tpope/vim-rhubarb'            " Gives Gbrowse command

" Tab completion
Plug 'hrsh7th/nvim-compe'           " autocomplete with LSP
Plug 'SirVer/ultisnips'             " snippet engine
Plug 'honza/vim-snippets'           " Actual snippets

" LSP related plugins
Plug 'neovim/nvim-lspconfig'        " Basic LSP plugin
Plug 'glepnir/lspsaga.nvim'         " enhanced LSP features
Plug 'ray-x/lsp_signature.nvim'     " Function signatures
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do' : ':TSUpdate' }
Plug 'nvim-treesitter/playground'   " Testing and queries for treesitter
" TODO: take a look at treesitter objects

" Miscellaneous and temp
Plug 'voldikss/vim-floaterm'
" Plug 'AckslD/nvim-neoclip.lua'
" Plug 'noahfrederick/vim-skeleton'
" TODO: checkout ctrlp

" Color schemes and appearance
Plug 'sainnhe/sonokai'
Plug 'tanvirtin/monokai.nvim'
Plug 'morhetz/gruvbox'
Plug 'rrethy/vim-hexokinase',   {'do': 'make hexokinase'}
Plug 'octol/vim-cpp-enhanced-highlight'

" Tags
Plug 'preservim/tagbar'             " Tags implementation
" Plug 'ludovicchabant/vim-gutentags' " generates tags

" File finding
Plug 'nvim-lua/popup.nvim'          " Telescope dependency
Plug 'nvim-lua/plenary.nvim'        " Telescope dependency
Plug 'nvim-telescope/telescope.nvim' "File finder and grep

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'lervag/vimtex'                " Latex
Plug 'iamcco/markdown-preview.nvim', {'do':{ -> mkdp#util#install()}, 'for':['markdown', 'vim-plug']}

" Nerd icons should be loaded last
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
"------------------------------------------------------------
" Vim native options and settings
"------------------------------------------------------------
" Setting the neovim color scheme
set termguicolors
syntax enable
colorscheme gruvbox

" Some basic options
" TODO: lookup wildmenu
set number
set hidden
set whichwrap+=<,>,h,l,[,]
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab autoindent
set encoding=utf-8 fileencoding=utf-8 fileformat=unix
set noshowmode
" set cursorline
set shortmess+=c
set clipboard+=unnamedplus
set ignorecase incsearch
set pumheight=15                " sets the pmenu height
set timeoutlen=1000
" set autochdir
set scrolloff=4
set splitbelow splitright       " split below instead of top

" Setting leader keys
let mapleader= ","
let maplocalleader = ","
=======
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
>>>>>>> master

" Mouse options
set mouse=a
let g:is_mouse_enabled = 1

<<<<<<< HEAD
" Enable filetype plugins
filetype plugin indent on
"------------------------------------------------------------
" Sourcing config files
"------------------------------------------------------------
source ~/.config/nvim/after/colors.vim
" source ~/.config/nvim/after/search.vim
" Airline settings
source ~/.config/nvim/after/airline.vim

lua require('plugins')
lua require('lsp_config')
lua require('compe_config')
lua require('tree_sitter')
lua require('lsp_saga')
lua require('which_key')
lua require('telescope_conf')
lua require('neorg_conf')
lua require('autopairs')
"------------------------------------------------------------
" Language specific settings here
"------------------------------------------------------------
" Setting up python3 for neovim
let g:python3_host_prog = '/usr/bin/python3'

" C++ syntax highlighting
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Latex settings
let g:tex_flavor = "latex"

" Templates for different types of files
au BufNewFile *.cpp             0r ~/.config/nvim/templates/skeleton.cpp
au BufNewFile *.c               0r ~/.config/nvim/templates/skeleton.c
au BufNewFile *.tex             0r ~/.config/nvim/templates/skeleton.tex
au BufNewFile *.py              0r ~/.config/nvim/templates/skeleton.py
au BufNewFile ~/cp/cf/*.cpp     %delete|0r ~/.config/nvim/templates/cf_skel.cpp

" Executing code from within nvim
au FileType python  nnoremap <buffer> <leader>rr :w<CR>:!python3 %<CR>
au FileType sh      nnoremap <buffer> <leader>rr :w<CR>:!sh %<CR>
au FileType c       nnoremap <buffer> <leader>rr :w<CR>:!gcc % && ./a.out<CR>

" CPP different flag runs for CP
au FileType cpp     nnoremap <buffer> <leader>rr :w<CR>:!g++ -std=c++17 -Wshadow -Wall % && ./a.out<CR>
au FileType cpp     nnoremap <buffer> <leader>rt :w<CR>:!g++ -std=c++17 -Wshadow -Wall % && ./a.out < testfile<CR>
au FileType cpp     nnoremap <buffer> <leader>rf :w<CR>:!g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result % && ./a.out < testfile <CR>

" Open module documentation
au FileType python  nnoremap <leader>gc yiw:!xdg-open https://docs.python.org/3/library/<C-r>".html<CR><CR>

" Compiling latex files
au FileType tex     nnoremap <leader>rr :w<CR>:!pdflatex %<CR>
au FileType tex     nnoremap <leader>gc yi}:!xdg-open https://ctan.org/pkg/<C-r>"<CR><CR>

" Shortcuts for python
au Filetype python  nnoremap <leader>p Iprint(<ESC>A)<ESC>

" Open vim plugins in github
au Filetype vim     nnoremap <leader>gc yi':!xdg-open https://github.com/<C-r>"<CR><CR>
au Filetype lua     nnoremap <leader>gc yi':!xdg-open https://github.com/<C-r>"<CR><CR>
"----------------------------------------------------------
" Plugin options
"----------------------------------------------------------
" Trigger configuration for UltiSnips.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>z"
let g:UltiSnipsJumpBackwardTrigger="<leader>Z"
let UltiSnipsEditSplit="vertical"

" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1
let g:syntastic_auto_jump = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_python_checkers = ["flake8", "pylint"]
let g:syntastic_stl_format = "errors: %e, warnings: %w"
let g:syntastic_quiet_messages = {
    \ "regex": ['docstring']
    \}

" Vimtex options
let g:tex_flavor = "latex"
" let g:vimtex_view_general_viewer = "zathura"

" Floatterm options
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

" Nvimtree settings
let g:nvim_tree_gitignore = 1
let g:nvim_tree_tab_open = 1
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = ['startify']

" Tagbar options
let g:tagbar_width = 35
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" Git gutter
hi GitGutterAdd     guifg=#009900   ctermfg=Green
hi GitGutterChange  guifg=#bbbb00   ctermfg=Yellow
hi GitGutterDelete  guifg=#ff2222   ctermfg=Red
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

" Hexokinase
let g:Hexokinase_highlighters = ['foregroundfull']

" Peekup
lua require('nvim-peekup.config').on_keystroke["delay"] = ''

"-----------------------------------------------------------
" Mappings for different plugins
"-----------------------------------------------------------
" General purpose vim shortcuts
nnoremap <silent> <space> :noh<CR><space>
nnoremap Y y$
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>vc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>sh :!cp ~/custom_headers_cpp/* .<CR><CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>w <C-W><C-W>
nnoremap <leader>b "_d
vnoremap <leader>b "_d
nnoremap <leader>ya ggVGy
nnoremap gb :ls<CR>:b<space>

" Move text around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" For floatterm
nnoremap <leader>tg :FloatermToggle<CR>
tnoremap <leader>tg <C-\><C-n>:FloatermToggle<CR>

" Shortcuts for file tree
nnoremap <leader>nn :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>

" Tag list toggle
map <leader>ta :TagbarToggle<CR>

" Git gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nnoremap <leader>hp :GitGutterPreviewHunk<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fv <cmd>lua require('telescope_conf').nvim_config_files()<CR>

" Syntastic mappings
nnoremap <leader>sc :SyntasticCheck<CR>

" Tree sitter show highlight group
nnoremap <leader>hi :TSHighlightCapturesUnderCursor<CR>

"------------------Miscellaneous----------------------------
" Open test file
nnoremap <leader>ot :call <SID>NewTestFile()<CR>
function! <SID>NewTestFile()
    let l:test_file = 'test.' . expand('%:e')
    execute ":e " . l:test_file
=======
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
>>>>>>> master
endfunc
