return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  opts = {
    fuzzy = { implementation = "lua" },
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
      ["<Tab>"] = { "accept", "fallback" },

      -- 回车 = 只换行，不确认（防止误触！主流规范）
      ["<CR>"] = { "fallback" },

      -- 上下箭头切换选项
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      -- 手动唤起补全
      ["<C-Space>"] = { "show" },
    },
  },
}
