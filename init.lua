vim.g.mapleader = " "

vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,gbk,gb2312,gb18030"
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- 快捷键配置
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "jk", [[<C-\><C-n>]], { noremap = true,  silent = true,})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", "<Cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>terminal<CR>", { silent = true })

-- 初始化插件系统
require("plugins")

-- 记得安装 JetBrainsMono Nerd Font字体，并设置给终端
-- 安装fd、rg文件查找工具，无需配置
    -- winget install sharkdp.fd
    -- winget install BurntSushi.ripgrep.MSVC
