return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,         -- 🔥 FORCE LOAD AT STARTUP
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
