return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        cmdline = {
            enabled = true,
            view = "cmdline_popup", -- 居中弹窗
        },
        messages = {
            enabled = true,
            view = "notify", -- 使用 notify 显示
            view_error = "notify",
            view_warn = "notify",
            view_history = "messages",
        },
        lsp = {
            progress = {
                enabled = true, -- LSP 加载进度条
            },
            hover = {
                enabled = true,
            },
            signature = {
                enabled = true,
            },
            message = {
                enabled = true,
            },
        },
        search = {
            enabled = true, -- / ? 搜索提示
        },
        routes = {
            -- 写文件提示：不打扰
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            },

            -- 搜索没找到
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "Pattern not found",
                },
                opts = { skip = true },
            },

            -- 行数变化 spam
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "%d+ lines",
                },
                opts = { skip = true },
            },
        },
        presets = {
            bottom_search = false, -- 搜索不用底部
            command_palette = true, -- 命令行 + 补全合并
            long_message_to_split = true,
            inc_rename = true, -- 重命名时实时预览
            lsp_doc_border = true, -- LSP 文档加边框
        },
        views = {
            cmdline_popup = {
                position = {
                    row = "20%",
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
                border = {
                    style = "rounded",
                },
            },
        },
    },
}
