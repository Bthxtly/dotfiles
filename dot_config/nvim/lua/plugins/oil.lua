return {
  {
    "stevearc/oil.nvim",
    opts = {
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
      keymaps = {
        ["+"] = "actions.select",
      },
    },
    dependencies = { { "echasnovski/mini.icons", lazy = true } },
  },
}
