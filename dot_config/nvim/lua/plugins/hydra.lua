return {
  {
    "nvimtools/hydra.nvim",
    lazy = true,
    config = function()
      local Hydra = require("hydra")
      Hydra({
        -- string? only used in auto-generated hint
        name = "Hydra's name",

        -- string | string[] modes where the hydra exists, same as `vim.keymap.set()` accepts
        mode = "n",

        -- string? key required to activate the hydra, when excluded, you can use
        -- Hydra:activate()
        body = "<leader>i",

        -- these are explained below
        hint = [[ ... ]],
        config = {},
        heads = {},
      })
    end,
  },
}
