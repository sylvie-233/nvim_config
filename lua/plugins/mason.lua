return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",          -- 注意：这里是 lspconfig 名
        "rust_analyzer",
        "pyright",
        "clangd",
      },
      automatic_installation = true,
    },
  }
}