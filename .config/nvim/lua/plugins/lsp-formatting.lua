return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 500,
        },
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          lua = { "stylua" },
          python = { "black" },
          rust = { "rustfmt" },
          solidity = { "prettier" },
        },
      })

      vim.keymap.set("n", "<leader>fm", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format file" })
    end,
  },
}

