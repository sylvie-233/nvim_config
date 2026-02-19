vim.g.mapleader        = " "

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

-- 快捷键配置
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true, })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", "<Cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>W", function()  -- 关闭右侧所有buffer
  local current = vim.api.nvim_get_current_win()
  require("bufferline").close_in_direction("right", current)
end, { desc = "Close all buffers to the right" })
vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>terminal<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", function()          -- 切换下一个窗口
    local wins = vim.api.nvim_tabpage_list_wins(0) -- 获取当前 tab 所有窗口
    local cur = vim.api.nvim_get_current_win()     -- 当前窗口
    for i, w in ipairs(wins) do
        if w == cur then
            vim.api.nvim_set_current_win(wins[i % #wins + 1])
            return
        end
    end
end, { desc = "Next window" })
vim.keymap.set("n", "<C-k>", function() -- 切换上一个窗口
    local wins = vim.api.nvim_tabpage_list_wins(0)
    local cur = vim.api.nvim_get_current_win()
    for i, w in ipairs(wins) do
        if w == cur then
            vim.api.nvim_set_current_win(wins[(i - 2) % #wins + 1])
            return
        end
    end
end, { desc = "Previous window" })
vim.keymap.set("n", "<C-p>", function()  -- 文件选择器
  require("snacks").picker.files()
end, { desc = "Find Files (Ctrl+P)" })
vim.keymap.set("n", "<C-f>", function()  -- 文本查找器
  require("snacks").picker.grep()
end, { desc = "Search text in project" })
vim.keymap.set("n", "<leader>sd", function()
  require("snacks").dashboard.open()
end, { desc = "Snacks Dashboard" })
vim.keymap.set("n", "<leader>F", function()
  require("conform").format()  -- 调用格式化命令工具
end, { desc = "Format (conform)" })
vim.keymap.set("n", "<leader>fm", function()  -- 格式化代码
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code Action"
})
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({
    border = "rounded",
    max_width = 80,
    max_height = 20,
  })
end, { desc = "Hover with border" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Type definition" })
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

-- 使用theme主题配色
vim.cmd [[colorscheme tokyonight]]

-- 记得安装 JetBrainsMono Nerd Font字体，并设置给终端
-- 安装fd、rg文件查找工具，无需配置
-- winget install sharkdp.fd
-- winget install BurntSushi.ripgrep.MSVC
