vim.g.mapleader = " "

vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,gbk,gb2312,gb18030"
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus" -- 把 Neovim 的 + 寄存器绑定到系统剪贴板（让 " 默认映射到 +）
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shell = "pwsh" -- 内置终端使用powershell
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s"
vim.opt.shellpipe  = "2>&1 | Out-File -Encoding UTF8 %s"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

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

vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>da", function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.diagnostic.setqflist()
  vim.cmd("copen")
end, { desc = "Toggle diagnostic quickfix" })

-- 初始化插件系统
require("plugins")

-- 记得安装 JetBrainsMono Nerd Font字体，并设置给终端
-- 安装fd、rg文件查找工具，无需配置
    -- winget install sharkdp.fd
    -- winget install BurntSushi.ripgrep.MSVC
