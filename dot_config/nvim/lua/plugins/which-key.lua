return {
  "folke/which-key.nvim",
  opts = {
    preset = "helix",
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>a", group = "ai" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file/find" },
        { "<leader>h", group = "highlight" },
        { "<leader>g", group = "git" },
        { "<leader>n", group = "debug" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "tab" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "diagnostics", icon = { icon = "󱖫 ", color = "green" } },
        { "z", group = "fold" },
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
      },
    },
  },
}
