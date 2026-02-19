return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
      "theHamsta/nvim-dap-virtual-text",

      -- mason 只保留 python（C/C++ 不再用 cpptools）
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },

    config = function()     -- 依赖gdb、debugpy模块
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.30 },
              { id = "breakpoints", size = 0.20 },
              { id = "stacks",      size = 0.30 },
              { id = "watches",     size = 0.20 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = { "repl", "console" },
            size = 10,
            position = "bottom",
          },
        },
      })

      require("nvim-dap-virtual-text").setup({
        commented = true,
      })

      dap.listeners.after.event_initialized["dapui"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui"] = function()
        dapui.close()
      end

      local map = vim.keymap.set
      map("n", "<F5>", dap.continue)
      map("n", "<F6>", dap.terminate)
      map("n", "<F7>", function()
        dap.terminate()
        vim.defer_fn(function()
          dap.run_last()
        end, 100)
      end)
      map("n", "<F10>", dap.step_over)
      map("n", "<F11>", dap.step_into)
      map("n", "<F12>", dap.step_out)

      map("n", "<leader>b", dap.toggle_breakpoint)
      map("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end)

      map("n", "<leader>dr", dap.repl.open)
      map("n", "<leader>du", dapui.toggle)
      map("n", "<leader>dq", function()
        dap.close()
        dapui.close()
      end)

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", },
      }

      dap.configurations.cpp = {
        {
          name = "Debug current file (gdb)",
          type = "gdb",
          request = "launch",

          program = function()
            local file = vim.fn.expand("%:p")
            local exe = vim.fn.fnamemodify(file, ":r") .. ".exe"

            if vim.fn.filereadable(exe) == 0 then
              vim.notify(
                "Executable not found:\n" .. exe .. "\n\nDid you compile it?",
                vim.log.levels.ERROR
              )
              return nil
            end

            return exe
          end,

          cwd = function()
            return vim.fn.expand("%:p:h")
          end,

          stopAtEntry = false,
          externalConsole = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp

      dap.adapters.python = function(cb, config)
        cb({
          type = "executable",
          command = "python",
          args = { "-m", "debugpy.adapter" },
        })
      end
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Debug current file (python)",
          program = "${file}",
          cwd = "${fileDirname}",
          console = "integratedTerminal",
          justMyCode = false,
        },
      }
    end,
  },
}
