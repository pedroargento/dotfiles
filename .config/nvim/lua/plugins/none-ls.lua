return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        -- Lua
				null_ls.builtins.formatting.stylua,
        -- Typescript
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.diagnostics.eslint_d,
        -- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.flake8,
        -- Rust
				null_ls.builtins.formatting.rustfmt,
        -- Bash
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.formatting.beautysh,
        -- Solidity
        null_ls.builtins.diagnostics.solhint,
        -- C
				null_ls.builtins.diagnostics.ast_grep,
				null_ls.builtins.formatting.ast_grep,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
