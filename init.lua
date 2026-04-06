vim.g.mapleader        = " "

-- 初始化基础配置
require("core")

-- 初始化插件系统
require("plugins")

-- 使用theme主题配色
vim.cmd [[colorscheme tokyonight]]

-- 记得安装 JetBrainsMono Nerd Font字体，并设置给终端
-- 安装fd、rg文件查找工具，无需配置
-- winget install sharkdp.fd
-- winget install BurntSushi.ripgrep.MSVC
