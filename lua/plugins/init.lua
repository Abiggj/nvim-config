vim.opt.relativenumber = true
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.system("echo $GITHUB_PERSONAL"))
  print("✅ GITHUB_PERSONAL copied to clipboard!")
end, { desc = "Copy GITHUB_PERSONAL token to clipboard" })
vim.keymap.set("n", "<leader>ct", function()
  vim.fn.setreg("+", vim.fn.system("echo $GITHUB_TOKEN"))
  print("Copied GITHUB_TOKEN to clipboard!")
end, { desc = "Copy GitHub token to clipboard" })
vim.keymap.set("n", "<leader>sb", function()
  vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#!/usr/bin/bash", "" })
  print("🚀 Shebang inserted!")
end, { desc = "Insert bash shebang" })
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
  },
}
