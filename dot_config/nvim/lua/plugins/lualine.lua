return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "folke/trouble.nvim",
    },
    opts = function()
      local opts = {
        options = {
          theme = "auto",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {
              "snacks_dashboard",
              "Outline",
              "Avante",
              "AvanteSelectedFiles",
              "dap-repl",
            },
          },
        },
        sections = {
          lualine_a = {},
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = {
            -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
      }

      -- fix wrong seperator highlight
      vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })

      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })

      return opts
    end,
  },
}
