-- lazy.nvim

-- 启动 lazy.nvim 插件管理器
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end

-- 运行path添加lazy安装包
vim.opt.rtp:prepend(lazypath)

-- 启动插件
require("lazy").setup({
    { import = "plugins.lazydev" },        -- nvim配置开发
    { import = "plugins.mason" },          -- Mason lsp安装
    { import = "plugins.lsp" },            -- lsp 内置
    { import = "plugins.cmp" },            -- 代码提示
    { import = "plugins.dap" },            -- 调试
    { import = "plugins.snacks" },         -- 工具箱
    { import = "plugins.noice" },          -- UI美化
    { import = "plugins.nvim-tree" },      -- 文件树
    { import = "plugins.bufferline" },     -- tab栏
    { import = "plugins.theme" },          -- 主题
    { import = "plugins.mini_move" },      -- 代码移动
    { import = "plugins.nvim-comment" },   -- 代码注释
    { import = "plugins.nvim-autopairs" }, -- 括号匹配
})
