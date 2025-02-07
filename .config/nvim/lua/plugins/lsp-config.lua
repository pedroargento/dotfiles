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
        "tsserver",  -- TypeScript/JavaScript
        "gopls",     -- Go
        "rust_analyzer", -- Rust
        "marksman",  -- Markdown
        "texlab",    -- LaTeX
        "html",
        "lua_ls",
        "pyright",
        "bashls",
        "clangd",
      },
      auto_install = true,
    },
  },

  -- Mason-Null-LS for managing formatters and linters
  {
    "jay-babu/mason-null-ls.nvim",
    lazy = true,
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        "prettier",               -- Formatter for JavaScript, TypeScript, HTML, CSS, Markdown, etc.
        "eslint_d",               -- Linter for JavaScript/TypeScript
--        "black",                  -- Formatter for Python
        "shfmt",                  -- Formatter for Shell scripts
        "stylua",                 -- Formatter for Lua
        "latexindent",            -- Formatter for LaTeX
      },
      automatic_installation = true, -- Automatically install tools
    },
  },

  -- Null-LS for integrating formatters/linters into Neovim
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    event = "BufReadPre",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- Formatters
          null_ls.builtins.formatting.prettier, -- For JS, TS, HTML, CSS, Markdown
          null_ls.builtins.formatting.black.with({
            command = "black",                -- Use globally installed black
          }),                                 -- Python
          null_ls.builtins.formatting.shfmt,  -- Shell
          null_ls.builtins.formatting.stylua, -- Lua
          null_ls.builtins.formatting.latexindent, -- LaTeX

          -- Linters
          null_ls.builtins.diagnostics.eslint_d, -- JavaScript/TypeScript
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

  -- LSPConfig for managing LSP server setups
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "BufReadPre",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local servers = {
        "tsserver",
        "gopls",
        "rust_analyzer",
        "marksman",
        "texlab",
        "html",
        "lua_ls",
        "pyright",
        "bashls",
        "clangd",
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
    end,
  },
}
