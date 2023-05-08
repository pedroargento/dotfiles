source ~/.config/nvim/plugs.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/langs.vim
source ~/.config/nvim/latex.vim
source ~/.config/nvim/uiconfig.vim
lua <<EOF
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)
lsp.setup()
require'nvim-tmux-navigation'.setup {
    disable_when_zoomed = true -- defaults to false
}


local nvim_tmux_nav = require('nvim-tmux-navigation')

nvim_tmux_nav.setup {
    disable_when_zoomed = true -- defaults to false
}

vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

EOF
