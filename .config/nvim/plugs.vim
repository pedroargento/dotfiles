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

" LSP Support
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
Plug 'alexghergh/nvim-tmux-navigation'
call plug#end() " start all the plugins above
