call plug#begin('~/.config/nvim/plug.vim')
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'sirver/ultisnips'
Plug 'lervag/vimtex'
Plug 'TovarishFin/vim-solidity' " , { 'for': 'solidity' }
Plug 'pangloss/vim-javascript'
Plug 'sohkai/syntastic-local-solhint'
Plug 'leafgarland/typescript-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black', { 'branch': 'stable' }
call plug#end() " start all the plugins above
