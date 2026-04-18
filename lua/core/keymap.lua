-- 快捷键配置

local map = vim.keymap.set

-- 基础快捷键
map("n", "<leader>q", "<cmd>q<CR>", { silent = true })
map('i', 'jk', '<Esc>', { silent = true })
map('t', '<Esc>', [[<C-\><C-n>]])
map('t', 'jk', [[<C-\><C-n>]], { silent = true })


-- snacks快捷键
map("n", "<leader>t", function()
  require("snacks").terminal.toggle()
end)
map("n", "<leader>sd", function()
    require("snacks").dashboard.open()
end, { desc = "Snacks Dashboard" })
map("n", "<leader>p", function() -- 文件选择器
  require("snacks").picker.files()
end, { desc = "Find Files" })
map("n", "<C-f>", function() -- 全局文本查找器
  require("snacks").picker.grep()
end, { desc = "Search text in project" })


-- Tab/窗口跳转快捷键
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true }) -- tab buffer切换
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { silent = true })
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { silent = true })
map('n', '<leader>w', '<Cmd>BufferLinePickClose<CR>', { silent = true })
map("n", "<leader>W", function() -- 关闭右侧所有buffer
    local current = vim.api.nvim_get_current_win()
    require("bufferline").close_in_direction("right", current)
end, { desc = "Close all buffers to the right" })
map("n", "<C-h>", "<C-w>h", { desc = "Left Panel" }) -- panel切换
map("n", "<C-j>", "<C-w>j", { desc = "Down Panel" })
map("n", "<C-k>", "<C-w>k", { desc = "Up Panel" })
map("n", "<C-l>", "<C-w>l", { desc = "Right Panel" })


-- 代码格式化快捷键
map("n", "<leader>F", function()
  require("conform").format()                -- 调用格式化命令工具
end, { desc = "Format (conform)" })
map("n", "<leader>fm", function() -- 格式化代码
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })


-- LSP相关快捷键
map("n", "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code Action"
})
map("n", "K", function()
  vim.lsp.buf.hover({
    border = "rounded",
    max_width = 80,
    max_height = 20,
  })
end, { desc = "Hover with border" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type definition" })
map("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>dn", vim.diagnostic.goto_next)
map("n", "<leader>dp", vim.diagnostic.goto_prev)
map("n", "<leader>da", function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.diagnostic.setqflist()
  vim.cmd("copen")
end, { desc = "Toggle diagnostic quickfix" })
