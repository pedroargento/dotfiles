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
EOF
