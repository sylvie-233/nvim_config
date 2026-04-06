-- 快捷键配置
-- 基础快捷键
vim.keymap.set('n', '<leader>t', '<Cmd>terminal<CR>', { silent = true })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })


-- snacks快捷键
vim.keymap.set("n", "<leader>sd", function()
    require("snacks").dashboard.open()
end, { desc = "Snacks Dashboard" })
vim.keymap.set("n", "<C-p>", function() -- 文件选择器
  require("snacks").picker.files()
end, { desc = "Find Files (Ctrl+P)" })
vim.keymap.set("n", "<C-f>", function() -- 全局文本查找器
  require("snacks").picker.grep()
end, { desc = "Search text in project" })


-- Tab/窗口跳转快捷键
vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true }) -- tab buffer切换
vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { silent = true })
vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { silent = true })
vim.keymap.set('n', '<leader>w', '<Cmd>BufferLinePickClose<CR>', { silent = true })
vim.keymap.set("n", "<leader>W", function() -- 关闭右侧所有buffer
    local current = vim.api.nvim_get_current_win()
    require("bufferline").close_in_direction("right", current)
end, { desc = "Close all buffers to the right" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Left Panel" }) -- panel切换
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Down Panel" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Up Panel" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Right Panel" })


-- 代码格式化快捷键
vim.keymap.set("n", "<leader>F", function()
  require("conform").format()                -- 调用格式化命令工具
end, { desc = "Format (conform)" })
vim.keymap.set("n", "<leader>fm", function() -- 格式化代码
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })


-- LSP相关快捷键
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
