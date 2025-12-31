return {
  {
    "nvimtools/hydra.nvim",
    keys = {
      "<leader>w",
    },
    config = function()
      local Hydra = require("hydra")
      Hydra({
        -- string? only used in auto-generated hint
        name = "window",
        -- string | string[] modes where the hydra exists, same as `vim.keymap.set()` accepts
        mode = "n",
        -- string? key required to activate the hydra, when excluded, you can use
        -- Hydra:activate()
        body = "<leader>w",

        hint = [[ hydra is enabled! ]],

        config = {
          exit = nil,
          foreign_keys = nil,
          color = "red",
          hint = {
            position = "top-right",
          },
        },

        heads = {
          { "w", "<C-w>w", { desc = "next window" } },
          { "W", "<C-w>W", { desc = "previous window" } },
          { "h", "<C-w>h", { desc = "focus on left" } },
          { "n", "<C-w>j", { desc = "focus on down" } },
          { "e", "<C-w>k", { desc = "focus on up" } },
          { "i", "<C-w>l", { desc = "focus on right" } },
          { "H", "<C-w>H", { desc = "move to very left" } },
          { "N", "<C-w>J", { desc = "move to very down" } },
          { "E", "<C-w>K", { desc = "move to very up" } },
          { "I", "<C-w>L", { desc = "move to very right" } },
          { "k", "<C-w>+", { desc = "height++" } },
          { "m", "<C-w>-", { desc = "height--" } },
          { ".", "<C-w>>", { desc = "width++" } },
          { ",", "<C-w><", { desc = "width--" } },
        },
      })
    end,
  },
}
