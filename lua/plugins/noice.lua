return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      status = {
        mode = { true },
        command = { true },
        search = { true },
        message = { true },
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup", -- 居中弹窗
      },
      messages = {
        enabled = true,
        view = "notify", -- 使用 notify 显示
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
      },
      lsp = {
        progress = {
          enabled = true, -- LSP 加载进度条
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
        message = {
          enabled = true,
        },
      },
      search = {
        enabled = true, -- / ? 搜索提示
      },
      routes = {
        -- 写文件提示：不打扰
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },

        -- 搜索没找到
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "Pattern not found",
          },
          opts = { skip = true },
        },

        -- 行数变化 spam
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "%d+ lines",
          },
          opts = { skip = true },
        },
      },
      presets = {
        bottom_search = false,  -- 搜索不用底部
        command_palette = true, -- 命令行 + 补全合并
        long_message_to_split = true,
        inc_rename = true,      -- 重命名时实时预览
        lsp_doc_border = true,  -- LSP 文档加边框
      },
      views = {
        cmdline_popup = {
          position = {
            row = "20%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", right_padding = 2 } },
        lualine_b = {
          "branch",   -- Git 分支
          "diff",     -- Git 修改
          "diagnostics" -- 错误/警告
        },
        lualine_c = {
          {
            "filename",
            file_status = true, -- 显示修改标记
            path = 0,         -- 只显示文件名
            symbols = {
              modified = "[+]",
              readonly = "[-]",
              unnamed = "[No Name]",
            }
          }
        },

        -- ✅ Noice 官方组件
        lualine_x = {
          { require("noice").api.status.message.get_hl, cond = require("noice").api.status.message.has },
          { require("noice").api.status.command.get,    cond = require("noice").api.status.command.has, color = { fg = "#ff9e64" } },
          { require("noice").api.status.mode.get,       cond = require("noice").api.status.mode.has,    color = { fg = "#ff9e64" } },
          { require("noice").api.status.search.get,     cond = require("noice").api.status.search.has,  color = { fg = "#ff9e64" } },
        },

        -- ✅ 右侧增强信息
        lualine_y = {
          "encoding", -- 编码：utf-8
          "fileformat", -- 文件格式：lf / crlf
          "filetype", -- 文件类型
        },
        lualine_z = {
          { "progress" }, -- 百分比进度
          { "location" }, -- 行列
        },
      },

      -- 不活动窗口也显示信息
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
    }
  }
}
