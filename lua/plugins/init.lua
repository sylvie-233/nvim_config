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
})
