return {
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neogit").setup {}
      vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Neogit Status" })
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git Diff View" })
      vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "File History" })
      vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { desc = "Repo History" })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup {}

      -- Git Files
      vim.keymap.set("n", "<leader>gf", "<cmd>FzfLua git_files<CR>", { desc = "Git Files" })
      -- Git Branches
      vim.keymap.set("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "Git Branches" })
      -- Git Commits
      vim.keymap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Git Commits" })
      -- Grep in Repo
      vim.keymap.set("n", "<leader>gg", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep" })
    end,
  },
}

