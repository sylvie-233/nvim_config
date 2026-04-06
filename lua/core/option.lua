-- 选项配置
vim.opt.encoding       = "utf-8"
vim.opt.fileencodings  = "utf-8,gbk,gb2312,gb18030"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.termguicolors  = true
vim.opt.clipboard      = "unnamedplus" -- 把 Neovim 的 + 寄存器绑定到系统剪贴板（让 " 默认映射到 +）
vim.opt.expandtab      = true
vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.shell          = "pwsh" -- 内置终端使用powershell
vim.opt.shellcmdflag   = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellredir     = "2>&1 | Out-File -Encoding UTF8 %s"
vim.opt.shellpipe      = "2>&1 | Out-File -Encoding UTF8 %s"
vim.opt.shellquote     = ""
vim.opt.shellxquote    = ""