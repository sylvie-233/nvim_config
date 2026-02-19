return { {
  "folke/snacks.nvim",
  opts = {
    dashboard = {     -- 启动 Neovim 时显示的仪表盘（类似 VSCode 欢迎页）
      enabled = true
    },
    terminal = {     -- 内置终端功能
      enabled = true
    },
    input = {     -- 统一管理各种输入框（prompt）
      enabled = true
    },
    picker = {     -- 提供类似 Telescope 的选择器（列表选择界面）
      enabled = true
    },
    statusline = {     -- 状态栏模块
      enabled = true,
      global = true,
      icons = true,
      style = "modern",
    },
    bufdelete = {     -- 缓冲区删除模块
      enabled = true
    }
  }
} }
