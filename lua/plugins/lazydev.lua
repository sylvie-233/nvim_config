return {
  "folke/lazydev.nvim",
  priority = 1000,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {
    library = {
      -- Neovim runtime（vim / vim.api）
      { path = vim.env.VIMRUNTIME,   words = { "vim" } },

      -- 常见插件生态（可选）
      { path = "${3rd}/luv/library", words = { "vim.uv" } },
    },
  },
}
