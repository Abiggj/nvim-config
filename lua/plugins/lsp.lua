return {
  {
    "neovim/nvim-lspconfig",
    lazy = false, -- force load since you had loading issues
    config = function()
      -- ✅ NEW Neovim 0.11+ API (no deprecation, future-safe)

      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "package.json", "tsconfig.json", ".git" },
      }

      vim.lsp.config.eslint = {
        cmd = { "eslint-language-server", "--stdio" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        root_markers = {
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.json",
          "package.json",
        },
      }

      -- ✅ Enable both servers
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("eslint")
    end,
  },
}
