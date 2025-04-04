return {
  -- Mason for managing LSPs
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = { "Mason" },
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-LSPConfig for managing LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        "ts_ls", "gopls", "rust_analyzer", "marksman", "texlab",
        "lua_ls", "pyright", "bashls", "clangd", "solidity",
      },
      auto_install = true,
    },
  },

  -- Mason-None-LS for managing formatters and linters
  {
    "jay-babu/mason-null-ls.nvim", -- works fine with none-ls
    lazy = true,
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        "prettier",
        "eslint_d",
        "shfmt",
        "stylua",
        "latexindent",
      },
      automatic_installation = true,
    },
  },

  -- None-LS (null-ls fork) for integrating formatters/linters
  {
    "nvimtools/none-ls.nvim", -- 👈 updated plugin
    lazy = true,
    event = "BufReadPre",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Formatters
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black.with({
            command = "black",
          }),
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.latexindent,

          -- Linters
          null_ls.builtins.diagnostics.eslint_d,

          -- Custom Solidity formatter (Forge)
          null_ls.builtins.formatting.forge_fmt.with({
            command = "forge",
            args = { "fmt" },
            filetypes = { "solidity" },
          }),
        },
        on_attach = function(client, bufnr)
          local bufopts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, bufopts)
        end,
      })
    end,
  },

  -- LSPConfig for setting up LSPs
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "BufReadPre",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local servers = {
        "ts_ls", "gopls", "rust_analyzer", "marksman",
        "texlab", "html", "lua_ls", "pyright", "bashls", "clangd",
      }

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)
      end

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      -- Special config for Solidity
      lspconfig.solidity.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          solidity = {
            includePath = "",
            remapping = {},
          },
        },
      })
    end,
  },
}

