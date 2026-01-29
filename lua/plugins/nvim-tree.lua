return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvim_tree = require("nvim-tree")
        local api = require("nvim-tree.api")

        nvim_tree.setup({
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                highlight_git = true,
            },
            -- 最新版本推荐用 on_attach 配置快捷键
            on_attach = function(bufnr)
                local opts = function(desc)
                    return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- 文件操作快捷键
                vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
                vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
                vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
                vim.keymap.set("n", "a", api.fs.create, opts("Create"))
                vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
                vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
                vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
                vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
                vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
                vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
                -- 上一级目录
                vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
                vim.keymap.set("n", "C", api.tree.change_root_to_node, { desc = "Set root to selected directory" })
            end,
        })

        -- 全局快捷键打开/关闭 nvim-tree
        vim.keymap.set("n", "<leader>e", function()
            api.tree.toggle({ focus = true })
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>fe", function()
            api.tree.focus() -- 直接把光标切换到 nvim-tree
        end, { noremap = true, silent = true })

        -- 切换目录
        vim.keymap.set("n", "<leader>cd", function()
            local input = vim.fn.input("Enter path: ", vim.loop.cwd() .. "/", "dir")
            if vim.fn.isdirectory(input) == 1 then
                api.tree.change_root(input)
            else
                print("Not a valid directory!")
            end
        end, { noremap = true, silent = true })
    end,
}
