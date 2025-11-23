return {
  {
    "stevearc/oil.nvim",
    opts = {
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
      keymaps = {
        ["+"] = "actions.select",
      },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
  },
}
