return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    opts = {
      snippets = {
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
      },

      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          border = "rounded",
        },
        documentation = {
          auto_show = true,
        },
      },

      sources = {
        default = {
          "lsp",
          "path",
          "buffer",
          "snippets",
        },
      },

      keymap = {
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show" },
      },
    },
  },
}
