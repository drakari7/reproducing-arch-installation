


" Plugins Section
call plug#begin('~/local/share/nvim/plugged')

Plug 'dikiaap/minimalist'

call plug#end()


" Setting the neovim color scheme
if (has("termguicolors"))
	set termguicolors
endif

syntax enable
colorscheme minimalist


set number relativenumber
set whichwrap+=<,>,h,l,[,]

