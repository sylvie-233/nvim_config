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
            ensure_installed = { -- 安装lsp
                "lua_ls",
                "rust_analyzer",
                "pyright",
                "clangd",
                "gopls",
                "ts_ls",
                "omnisharp",
                "ruff",
            },
            automatic_installation = true, -- 开启自动安装
        },
    }
}

