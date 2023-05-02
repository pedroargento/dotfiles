" -----------------------------------------------------------------------------
"  GENERAL SETTINGS FOR EVERYONE
"  ----------------------------------------------------------------------------
filetype plugin indent on
set title
set nocompatible
set autoindent
set nomodeline " disable modeline vulnerability
map <SPACE> <leader>

for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exec 'noremap' key '<Nop>'
    exec 'inoremap' key '<Nop>'
endfor
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
map <silent> <C-n> :NERDTreeToggle<CR>
" FZF maps
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <C-f> :GFiles<CR>
" text encoding
set encoding=utf8

" use 4 spaces for tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set backspace =indent,eol,start
set hidden
set laststatus =2

" Set linenumbers
set number
set relativenumber
set wrap

" column ruler at 100
set ruler
set colorcolumn=80

" Highlight searching
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase

set splitbelow
set splitright
if has("nvim")
    set inccommand="nosplit"
endif

set autoread " autoread files
set mouse=a " use mouse for scroll or window size
