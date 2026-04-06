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
      ensure_installed = {       -- 安装lsp
        "lua_ls",
        "pyright",
        "ruff",
        "clangd",
        "cmake",
        "rust_analyzer",
        "omnisharp",
        "powershell_es",
        -- "gopls",
        -- "ts_ls",
        -- "jdtls",
        -- "lemminx",                         -- xml lsp
      },
      automatic_installation = true,       -- 开启自动安装
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- "java-test",
          -- "java-debug-adapter",
        },
      })
    end,
  },
  -- {
  --   "mfussenegger/nvim-jdtls",
  --   ft = "java",
  -- }
}
