return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      { "mfussenegger/nvim-dap-python", lazy = true },
    },

    config = function()
      -- Python
      if vim.bo.filetype == "python" then
        require("dap-python").setup("python3")
      end

      -- Java
      if vim.bo.filetype == "java" then
        require("jdtls.dap").setup_dap_main_class_configs()
        -- require("jdtls").test_class()
        -- require("jdtls").test_nearest_method()
      end

      local dap = require("dap")

      -- C and C++
      if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
        require("dap-python").setup("python3")
        dap.adapters["codelldb"] = {
          type = "executable",
          command = "/usr/bin/codelldb",
        }
        for _, lang in ipairs({ "c", "cpp" }) do
          dap.configurations[lang] = {
            {
              type = "codelldb",
              request = "launch",
              name = "Launch file",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
            },
            -- {
            --   type = "codelldb",
            --   request = "attach",
            --   name = "Attach to process",
            --   pid = require("dap.utils").pick_process,
            --   cwd = "${workspaceFolder}",
            -- },
          }
        end
      end
    end,
  },

  {
    "miroshQa/debugmaster.nvim",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dm = require("debugmaster")
      -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
      vim.keymap.set({ "n", "v" }, "<leader>n", dm.mode.toggle, { nowait = true })
      vim.keymap.set("t", "<C-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    end,
    keys = { "<leader>n" },
  },
}
