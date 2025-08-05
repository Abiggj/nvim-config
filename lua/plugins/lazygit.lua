return {
  
  "kdheepak/lazygit.nvim",
  
  cmd = {
    "Lazygit",
    "LazygitConfig",
    "LazygitCurrentFile",
    "LazygitFilter",
    "LazygitFilterCurrentFile",
  },
  
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  keys = {
    {
      "<leader>lg",
      function()
        vim.cmd("LazyGit")
      end,
      desc = "Open lazy git"
    },
  },
  event = "VeryLazy",
}
